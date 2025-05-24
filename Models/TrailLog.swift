//
//  TrailLog.swift
//  TrailLog
//
//  Created by Brian Maina on 5/24/25.
//

import Foundation

struct TrailLog: Identifiable, Codable {
    let id = UUID()
    var title = ""
    var date = Date()
    var notes = ""
}
