//
//  MKPolyline+.swift
//

import MapKit

public extension MKPolyline {
    func distance() -> CLLocationDistance {
        var distance: CLLocationDistance = 0
        
        for i in 0..<pointCount - 1 {
            let start = points()[i].coordinate
            let end = points()[i + 1].coordinate
            distance += MKMapPoint(start).distance(to: MKMapPoint(end))
        }
        
        return distance
    }
}
