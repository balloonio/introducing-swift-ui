//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/21/22.
//

import SwiftUI

struct LandmarkDetails: View {
    @EnvironmentObject var modelData : ModelData
    var landmark: Landmark
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        // If this was still VStack, the circle image's location
        // will move to a bit lower
        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300.0)
                .ignoresSafeArea(edges: .top)
            CircleImage(image: landmark.image)
                .offset(y:-150)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    .foregroundColor(.black)
                    
                    FavoriteButton(isSet:$modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)
            }.padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetails_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetails(landmark: ModelData().landmarks[0])
            .environmentObject(ModelData())
    }
}
