//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/21/22.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showOnlyFavorites: Bool = true
    
    private var filteredLandmarks : [Landmark] {
        landmarks.filter { landmark in
            landmark.isFavorite || !showOnlyFavorites
        }
    }
    var body: some View {
        NavigationView {
            List (filteredLandmarks) { landmark in
                NavigationLink(destination: LandmarkDetails(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 Pro Max",
                 "iPhone SE (2nd generation)"],
                id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
