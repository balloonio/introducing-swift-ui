//
//  Profile.swift
//  Landmarks
//
//  Created by Bolun Zhang on 10/7/22.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate: Date = Date()
    
    static let `default` = Profile(username: "Bolun")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌸"
        case summer = "☀️"
        case autumn = "🍂"
        case winter = "❄️"
        var id: String {rawValue}
    }
}
