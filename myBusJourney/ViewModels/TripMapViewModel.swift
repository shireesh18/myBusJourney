//
//  TripMapViewModel.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class TripMapViewModel: ObservableObject {
    let tripId: String
    var route: [BusStop] = []
    var mapLocation: BusStop {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56.45612, longitude: -2.97472) ,
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var showBusStopsList: Bool = false

    init(tripId: String) {
        self.tripId = tripId
        self.mapLocation = BusStop(id: 123, departure: Departure(scheduled: "2024-05-30T11:40:00+00:00", actual: nil, estimated: nil), arrival: Arrival(scheduled: "2024-05-30T13:35:00+00:00", actual: nil, estimated: nil), location: Location(id: 123, name: "Dundee Greenmarket", lat: 56.45612, lon: -2.97472))
    }


    func fetchRoute() async throws {
        let url = URL(string: "https://api.ember.to/v1/trips/\(tripId)/")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Route.self, from: data)
            route = result.route
    }

    private func updateMapRegion(location: BusStop) {
        withAnimation(.easeInOut) {
            self.mapRegion = MKCoordinateRegion(
                        center: location.location.coordinates,
                        span: mapSpan)
        }
    }

    func toggleBustStopsList() {
        withAnimation(.easeInOut) {
            showBusStopsList = !showBusStopsList
        }
    }

    func showNextBusStop(busStop: BusStop) {
        withAnimation(.easeInOut) {
            mapLocation = busStop
            showBusStopsList = false
        }
    }

    func nextButtonTapped() {

        guard let currentIndex = route.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find index")
            return
        }
        //check if nextIndex is valid
        let nextIndex = currentIndex + 1
        guard route.indices.contains(nextIndex) else {
            //nextIndex is not valid, restart from 0
            guard let firstStop = route.first else {
                return
            }
            showNextBusStop(busStop: firstStop)
            return
        }
        //nextIndex is valid
        let nextStop = route[nextIndex]
        showNextBusStop(busStop: nextStop)
    }
}
