//
//  ModelData.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/20/22.
//

import Foundation
import Combine

class ModelData: ObservableObject {
    @Published var landmarks : [Landmark] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var hikes : [Hike] = load("hikeData.json")
    
    var categories2Landmarks : [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue})
    }
    var featuredLandmarks : [Landmark] {
        landmarks.filter {$0.isFeatured}
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Cannot find file with name = \(fileName)")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Cannot load \(fileName) from the main bundle with error = \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
