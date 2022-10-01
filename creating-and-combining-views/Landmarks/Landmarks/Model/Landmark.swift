//
//  Landmark.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/20/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Codable,  Hashable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    enum Category: String, Codable, CaseIterable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    var category: Category
    
    private var imageName: String
    // computed property
    var image : Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    struct Coordinates : Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    // computed property
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude:coordinates.latitude, longitude:coordinates.longitude)
    }
}
