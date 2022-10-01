//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Bolun Zhang on 9/30/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData : ModelData
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    LandmarkDetails(landmark: modelData.featuredLandmarks[0])
                } label: {
                    modelData.featuredLandmarks[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                }
                
                ForEach(modelData.categories2Landmarks.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories2Landmarks[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
            
    }
}
