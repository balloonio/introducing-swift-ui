//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/28/22.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width = min(geometry.size.height, geometry.size.width)
                let height = width
                let xScale = 0.8
                let xOffset = (width * (1-xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment))
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(to: CGPoint(
                        x: width * segment.line.x + xOffset,
                        y: height * segment.line.y
                    ))
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width*segment.curve.x + xOffset,
                            y: height*segment.curve.y),
                        control: CGPoint(
                            x: width*segment.control.x + xOffset,
                            y: height*segment.control.y))
                }
                
            }
            .fill(
                .linearGradient(
                    Gradient(
                        colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y:1))
            )
        }
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
