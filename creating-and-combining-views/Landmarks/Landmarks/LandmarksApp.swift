//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/19/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
