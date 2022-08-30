//
//  Badge.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/29/22.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / 8) * 360.0)
                
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack{
            BadgeBackground()
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }.scaledToFit()
        
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 Pro Max",
                 "iPhone SE (2nd generation)"],
                id: \.self) { deviceName in
            Badge()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}
