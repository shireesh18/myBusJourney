//
//  Location.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 29/05/2024.
//

import Foundation
import MapKit

struct Location: Decodable {
    let id: Int
    let name: String
    let lat: Double
    let lon: Double
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

extension Location {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lat
        case lon
    }
}
