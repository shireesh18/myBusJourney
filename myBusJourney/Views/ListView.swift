//
//  ListView.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import SwiftUI

struct ListView: View {
    let quotes: [Quote]

    var body: some View {
        List(quotes, id: \.self) { quote in
            NavigationLink(value: quote) {
                TodayScheduleView(quote: quote)
            }
        }
        .navigationDestination(for: Quote.self) { quote in
            TripMapView(trip: quote.legs[0])
        }
        .listStyle(.plain)
        .navigationTitle("Today's Bus Trips")
    }
}


