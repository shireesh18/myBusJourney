//
//  Trip.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import Foundation

struct Trip: Decodable, Hashable {

    static func == (lhs: Trip, rhs: Trip) -> Bool {
        return lhs.tripUid == rhs.tripUid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(tripUid)
    }

    let tripUid : String
    let origin: Origin
    let destination: Destination
    let departure: Departure
    let arrival: Arrival
}

extension Trip {
    enum CodingKeys: String, CodingKey {
        case tripUid = "trip_uid"
        case origin
        case destination
        case departure
        case arrival
    }
}
