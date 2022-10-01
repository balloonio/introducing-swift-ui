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
                ForEach(modelData.categories2Landmarks.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
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
