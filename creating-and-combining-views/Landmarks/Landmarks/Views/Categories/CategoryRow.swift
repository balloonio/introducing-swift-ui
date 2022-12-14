//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Bolun Zhang on 9/30/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName : String
    var items : [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink {
                            LandmarkDetails(landmark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var categoryName = landmarks[0].category.rawValue
    static var previews: some View {
        CategoryRow(
            categoryName: categoryName, items: Array(landmarks.prefix(6))
        )
    }
}
