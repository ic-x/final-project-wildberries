//
//  FlightMapView+.swift
//

import MapKit

extension FlightMapView {
    public class Coordinator: NSObject, MKMapViewDelegate {
        var parent: FlightMapView
        var flightProgress: CGFloat = 0.0
        var flightMarker: MKPointAnnotation?
        var timer: Timer?
        
        init(_ parent: FlightMapView) {
            self.parent = parent
        }
        
        func startFlightAnimation(mapView: MKMapView, path: MKGeodesicPolyline) {
            let totalDistance = path.distance()
            let duration: TimeInterval = 10.0
            let interval = 0.02
            let distancePerInterval = totalDistance * interval / duration
            
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                self.flightProgress += CGFloat(distancePerInterval / totalDistance)
                if self.flightProgress >= 1.0 {
                    self.flightProgress = 0.0
                    self.timer?.invalidate()
                }
                
                if let currentPoint = self.currentCoordinate(along: path, progress: self.flightProgress) {
                    self.updateFlightMarker(on: mapView, at: currentPoint)
                }
            }
        }
        
        func currentCoordinate(along polyline: MKGeodesicPolyline, progress: CGFloat) -> CLLocationCoordinate2D? {
            let totalDistance = polyline.distance()
            let targetDistance = totalDistance * Double(progress)
            
            var currentDistance: CLLocationDistance = 0
            for i in 0..<polyline.pointCount - 1 {
                let start = polyline.points()[i].coordinate
                let end = polyline.points()[i + 1].coordinate
                let segmentDistance = MKMapPoint(start).distance(to: MKMapPoint(end))
                
                if currentDistance + segmentDistance >= targetDistance {
                    let remainingDistance = targetDistance - currentDistance
                    let ratio = remainingDistance / segmentDistance
                    
                    let latitude = start.latitude + (end.latitude - start.latitude) * ratio
                    let longitude = start.longitude + (end.longitude - start.longitude) * ratio
                    
                    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                }
                currentDistance += segmentDistance
            }
            
            return nil
        }
        
        func updateFlightMarker(on mapView: MKMapView, at coordinate: CLLocationCoordinate2D) {
            if flightMarker == nil {
                flightMarker = MKPointAnnotation()
                mapView.addAnnotation(flightMarker!)
            }
            flightMarker?.coordinate = coordinate
        }
        
        public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKGeodesicPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .purple
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer()
        }
        
        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "point"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = false
            }
            
            let circleImage = UIImage(systemName: "circle.fill")?.withTintColor(.purple, renderingMode: .alwaysOriginal)
            
            let size = CGSize(width: 12, height: 12)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            circleImage?.draw(in: CGRect(origin: .zero, size: size))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            annotationView?.image = resizedImage
            addPulseAnimation(to: annotationView!)
            
            return annotationView
        }
        
        func addPulseAnimation(to view: MKAnnotationView) {
            let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
            pulseAnimation.duration = 1.0
            pulseAnimation.fromValue = 0.9
            pulseAnimation.toValue = 1.4
            pulseAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            pulseAnimation.autoreverses = true
            pulseAnimation.repeatCount = .infinity
            view.layer.add(pulseAnimation, forKey: "pulse")
        }
    }
}
