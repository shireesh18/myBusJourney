//
//  TripViewModel.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 29/05/2024.
//

import Foundation

@Observable
class TripViewModel {
    let tripId: String
    var route: [BusStop] = []

    init(tripId: String) {
        self.tripId = tripId
    }

    func fetchRoute() async throws {
        let url = URL(string: "https://api.ember.to/v1/trips/\(tripId)/")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Route.self, from: data)
            route = result.route
    }
}


