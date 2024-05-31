//
//  BusStopMapView.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import SwiftUI

struct BusStopMapView: View {

    @EnvironmentObject private var viewModel: TripMapViewModel
    let busStop: BusStop

    var body: some View {
        HStack(alignment:.bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                busStatusSection
            }
            VStack(spacing:8) {
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 75)
        )
        .cornerRadius(10)
    }
}

struct BusStopMapView_Previews : PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()

            BusStopMapView(busStop: BusStop(id: 124, departure: Departure(scheduled: "2024-05-29T20:00:00+00:00", actual: nil, estimated: nil), arrival: Arrival(scheduled: "2024-05-29T20:00:00+00:00", actual: nil, estimated: nil), location: Location(id: 12, name: "Dundee", lat: 56.45612, lon: -2.97472)))
                .padding()
        }
    }
}

extension BusStopMapView {
    private var imageSection: some View {
        ZStack {
            Image(systemName: "bus.doubledecker")
                .resizable()
                .foregroundColor(.yellow)
                .scaledToFit()
                .frame(width:100, height: 100)
                .cornerRadius(10)
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }

    private var busStatusSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(busStop.location.name)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.primary)
            HStack {
                Text("Arrival:")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                Text(busStop.arrival.scheduleTime)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Departure:")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                Text(busStop.departure.scheduleTime)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonTapped()
        } label: {
            Text("Next Stop")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }

}
