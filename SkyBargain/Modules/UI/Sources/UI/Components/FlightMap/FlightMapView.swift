//
//  FlightMapView.swift
//

import SwiftUI
import MapKit

@MainActor @preconcurrency
public struct FlightMapView: UIViewRepresentable {
    public let startCoordinate: CLLocationCoordinate2D
    public let endCoordinate: CLLocationCoordinate2D
    
    public init(startCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.777228027197594, longitude: -73.87414113600639), endCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 38.85131579313656, longitude: -77.04022484079726)) {
        self.startCoordinate = startCoordinate
        self.endCoordinate = endCoordinate
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let path = MKGeodesicPolyline(coordinates: [startCoordinate, endCoordinate], count: 2)
        let region = self.calculateRegion(for: path)
        mapView.setRegion(region, animated: false)
        
        let startAnnotation = MKPointAnnotation()
        startAnnotation.coordinate = startCoordinate
        mapView.addAnnotation(startAnnotation)
        
        let endAnnotation = MKPointAnnotation()
        endAnnotation.coordinate = endCoordinate
        mapView.addAnnotation(endAnnotation)
        
        context.coordinator.startFlightAnimation(mapView: mapView, path: path)
        
        return mapView
    }
    
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
        
        let startAnnotation = MKPointAnnotation()
        startAnnotation.coordinate = startCoordinate
        uiView.addAnnotation(startAnnotation)
        
        let endAnnotation = MKPointAnnotation()
        endAnnotation.coordinate = endCoordinate
        uiView.addAnnotation(endAnnotation)
        
        let path = MKGeodesicPolyline(coordinates: [startCoordinate, endCoordinate], count: 2)
        uiView.addOverlay(path)
        
        let region = self.calculateRegion(for: path)
        uiView.setRegion(region, animated: true)
        
        context.coordinator.flightProgress = 0.0
        context.coordinator.startFlightAnimation(mapView: uiView, path: path)
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    private func calculateRegion(for path: MKGeodesicPolyline) -> MKCoordinateRegion {
        var minLat = CLLocationDegrees(90.0)
        var maxLat = CLLocationDegrees(-90.0)
        var minLon = CLLocationDegrees(180.0)
        var maxLon = CLLocationDegrees(-180.0)
        
        for i in 0..<path.pointCount {
            let coordinate = path.points()[i].coordinate
            minLat = min(minLat, coordinate.latitude)
            maxLat = max(maxLat, coordinate.latitude)
            minLon = min(minLon, coordinate.longitude)
            maxLon = max(maxLon, coordinate.longitude)
        }
        
        let span = MKCoordinateSpan(latitudeDelta: maxLat - minLat + 1.5, longitudeDelta: maxLon - minLon + 1.5)
        let center = CLLocationCoordinate2D(latitude: (minLat + maxLat) / 2, longitude: (minLon + maxLon) / 2)
        
        return MKCoordinateRegion(center: center, span: span)
    }
}

#Preview {
    FlightMapView()
        .ignoresSafeArea()
}
