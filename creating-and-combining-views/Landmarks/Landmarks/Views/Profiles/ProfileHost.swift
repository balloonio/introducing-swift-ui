//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Bolun Zhang on 10/7/22.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draft : Profile = Profile.default
    var body: some View {
        //Text("Profile for: \(draft.username)")
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draft)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
