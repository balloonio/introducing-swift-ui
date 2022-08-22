//
//  MapView.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/20/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinates :CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinates)
            }
    }
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: landmarks[0].locationCoordinates)
    }
}
