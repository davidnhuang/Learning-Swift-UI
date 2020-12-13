//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by David N. Huang on 12/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData : ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notification: \(profile.prefersNotification ? "on" : "off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Dat")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.50)
                            .hueRotation(Angle(degrees: 45))
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
        ProfileSummary(profile: Profile.default).environmentObject(ModelData())
    }
}
