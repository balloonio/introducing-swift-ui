//
//  Hike.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/29/22.
//

import Foundation

struct Hike : Codable, Identifiable, Hashable {
    var name : String
    var id : Int
    var distance: Double
    var difficulty: Int
    var observation : [Observation]
    
    struct Observation : Codable, Hashable {
        var elevation: [Double]
        var pace: [Double]
        var heartRate: [Double]
        var distanceFromStart: Double
    }
}
