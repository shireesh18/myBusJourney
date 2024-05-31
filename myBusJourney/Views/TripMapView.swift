//
//  BusStopMapView.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import SwiftUI
import MapKit

struct TripMapView: View {

    @State private var viewModel: TripMapViewModel
    let maxWidthForIpad: CGFloat = 700

    var body: some View {
        ZStack {
            mapLayer
            .ignoresSafeArea()

            VStack(spacing: 0) {
                header
                    .padding(.top)
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                busStopDetails
                .task {
                    try? await viewModel.fetchRoute()
                }.refreshable {
                    try? await viewModel.fetchRoute()
                }
            }
        }
        .environmentObject(viewModel)
    }
}

extension TripMapView {
    init(trip : Trip) {
        self.viewModel = TripMapViewModel(tripId: trip.tripUid)
    }

    private var header: some View {
        VStack {
            Button(action: viewModel.toggleBustStopsList, label: {
                Text(viewModel.mapLocation.location.name)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .animation(.none, value: viewModel.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: viewModel.showBusStopsList ? 180: 0))
                }
            })

            if viewModel.showBusStopsList {
                BusStopsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y: 15)
    }
}

struct TripMapView_Previews: PreviewProvider {
    static var previews: some View {
      TripMapView(trip: Trip(tripUid: "123", origin: Origin(name: "GreenMarket", regionName: "Dundee", lat: 56.45612, lon: -2.97472), destination: Destination(name: "St Andrews Square", regionName: "Edinburgh", lat: 55.954905, lon: -3.193094), departure: Departure(scheduled: "2024-05-30T11:40:00+00:00", actual: nil, estimated: nil), arrival: Arrival(scheduled: "2024-05-30T13:35:00+00:00", actual: nil, estimated: nil)))
    }
}

extension TripMapView {
    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.route) { busStop in
            MapAnnotation(coordinate: busStop.location.coordinates) {
                BusStopMapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == busStop ? 1: 0.7)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        viewModel.showNextBusStop(busStop: busStop)
                    }
            }
        }
    }

    private var busStopDetails: some View {
        ZStack {
            ForEach(viewModel.route) { busStop in
                if viewModel.mapLocation == busStop {
                    BusStopMapView(busStop: busStop)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
