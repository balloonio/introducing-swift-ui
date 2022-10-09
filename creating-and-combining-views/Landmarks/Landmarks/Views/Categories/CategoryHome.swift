//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Bolun Zhang on 9/30/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData : ModelData
    @State private var showProfile : Bool = false
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
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
            
    }
}
