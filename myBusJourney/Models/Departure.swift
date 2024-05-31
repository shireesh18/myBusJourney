//
//  Departure.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import Foundation

struct Departure: Decodable {
    var scheduled: String
    var scheduleTime: String {
        return Helper.extractTimeFromDate(scheduled)
    }
    let actual: String?
    let estimated: String?
}

extension Departure {
    enum CodingKeys : String, CodingKey {
        case scheduled
        case actual
        case estimated
    }
}
