//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/28/22.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(
        red: 79.0 / 255,
        green: 79.0 / 255,
        blue: 191.0 / 255)
    
    @State private var width : CGFloat = 0
    private var height : CGFloat { width * 0.85 }
    private var spacing : CGFloat { width * 0.030 }
    private var middle : CGFloat { width * 0.5 }
    private var topWidth : CGFloat { width * 0.226 }
    private var topHeight : CGFloat { height * 0.488 }

    var body: some View {
        GeometryReader { geometry in
            
            Path { path in
                width = min(geometry.size.width, geometry.size.height)
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
                
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
