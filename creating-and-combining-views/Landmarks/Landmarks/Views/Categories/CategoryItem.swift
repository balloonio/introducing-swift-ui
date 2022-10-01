//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Bolun Zhang on 10/1/22.
//

import SwiftUI

struct CategoryItem: View {
    var landmark : Landmark
    var body: some View {
        VStack (alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var landmark = ModelData().landmarks[0]
    static var previews: some View {
        CategoryItem(landmark: landmark)
    }
}
