//
//  Geotification.swift
//  Geotify
//
//  Created by Tyler Young on 10/26/16.
//  Copyright © 2016 Tyler Young. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit


class Geotification: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D //latitude, longitude
    var radius: CLLocationDistance //double distance
    var note: String
    var onEntry: Bool
    
    var title: String? {
        if note.isEmpty {
            return "No Note"
        }
        return note
    }
    
    init(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, note: String, onEntry: Bool) {
        
        self.coordinate = coordinate
        self.radius = radius
        self.note = note
        self.onEntry = onEntry
    }
    
    
    
}
