//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Bolun Zhang on 10/7/22.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData : ModelData
    var profile : Profile
    var body: some View {
        ScrollView {
            VStack {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: \(profile.goalDate.formatted(date: .abbreviated, time: .standard))")
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "Hero")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Fire Path")
                                .hueRotation(Angle(degrees: 45))
                                .grayscale(0.5)
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile:Profile.default)
            .environmentObject(ModelData())
    }
}
