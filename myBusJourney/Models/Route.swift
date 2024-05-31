//
//  Route.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 29/05/2024.
//

import Foundation

struct Route: Decodable {
    let route: [BusStop]
}

extension Route {
    enum CodingKeys: String, CodingKey {
        case route
    }
}
