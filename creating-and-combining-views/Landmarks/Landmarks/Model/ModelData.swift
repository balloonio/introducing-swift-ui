//
//  ModelData.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/20/22.
//

import Foundation

func load<T: Decodable>(fileName: String) -> T {
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
