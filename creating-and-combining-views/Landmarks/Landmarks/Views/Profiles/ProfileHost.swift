//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Bolun Zhang on 10/7/22.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData : ModelData
    @State private var draft : Profile = Profile.default
    var body: some View {
        //Text("Profile for: \(draft.username)")
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button {
                        editMode?.wrappedValue = .inactive
                        draft = Profile.default
                    } label: {
                        Text("Cancel")
                    }

                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draft)
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
