//
//  Landmark.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/20/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Codable,  Hashable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    // computed property
    var image : Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    struct Coordinates : Hashable, Codable {
        var lat: Double
        var long: Double
    }
    
    // computed property
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude:coordinates.lat, longitude:coordinates.long)
    }
}
