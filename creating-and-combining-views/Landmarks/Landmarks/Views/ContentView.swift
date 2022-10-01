//
//  ContentView.swift
//  Landmarks
//
//  Created by Bolun Zhang on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabMode : Tab = .tile
    
    enum Tab {
        case tile
        case list
    }
    
    var body: some View {
        TabView(selection: $tabMode) {
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.tile)
            
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
