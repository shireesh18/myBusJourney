//
//  BusStopsListView.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import SwiftUI

struct BusStopsListView: View {

    @EnvironmentObject private var viewModel: TripMapViewModel
 
    var body: some View {
        List {
            ForEach(viewModel.route) { busstop in
                Button {
                    viewModel.showNextBusStop(busStop: busstop)
                } label: {
                    listRowView(busStop: busstop)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

extension BusStopsListView {
    func listRowView(busStop: BusStop) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(busStop.location.name)
                    .font(.caption2)
                    .foregroundStyle(.accent)
                Text("Arrival:")
                    .font(.caption)
                    .foregroundStyle(.primary)
                Text(busStop.arrival.scheduleTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Departure:")
                    .font(.caption)
                    .foregroundStyle(.primary)
                Text(busStop.departure.scheduleTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }

        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .frame(maxHeight: .infinity)
    }
}

struct BusStopsListView_Previews: PreviewProvider {
    static var previews: some View {
        BusStopsListView()
            .environmentObject(TripMapViewModel(tripId: "3edRrRzQqs23JacFdyScU8"))
    }
}
