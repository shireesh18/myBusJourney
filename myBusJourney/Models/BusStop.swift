//
//  BusStop.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 29/05/2024.
//

import Foundation

struct BusStop : Decodable, Identifiable, Equatable {
    //Equatable
    static func == (lhs: BusStop, rhs: BusStop) -> Bool {
        lhs.id == rhs.id
    }
    //Identifiable
    let id: Int
    let departure: Departure
    let arrival: Arrival
    let location: Location
}

extension BusStop {
    enum CodingKeys: String, CodingKey {
        case id
        case departure
        case arrival
        case location
    }
}
