//
//  Destination.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import Foundation

struct Destination: Decodable {
    let name: String
    let regionName: String
    let lat: Double
    let lon: Double
}

extension Destination {
    enum CodingKeys: String, CodingKey {
        case name
        case regionName = "region_name"
        case lat
        case lon
    }
}
