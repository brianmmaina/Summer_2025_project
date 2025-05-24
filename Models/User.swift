//
//  User.swift
//  TrailLog
//
//  Created by Brian Maina on 5/24/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    var username = ""
    var email = ""
}
