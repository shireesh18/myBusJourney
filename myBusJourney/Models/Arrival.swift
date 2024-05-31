//
//  Arrival.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import Foundation

struct Arrival: Decodable {
    let scheduled: String
    var scheduleTime: String {
        Helper.extractTimeFromDate(scheduled)
    }
    let actual: String?
    let estimated: String?
}

extension Arrival {
    enum CodingKeys : String, CodingKey {
        case scheduled
        case actual
        case estimated
    }
}
