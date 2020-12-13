//
//  Profile.swift
//  Landmarks
//
//  Created by David N. Huang on 12/12/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotification: Bool
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar", prefersNotification: true)
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
    }
}
