//
//  TodayScheduleView.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import SwiftUI

struct TodayScheduleView: View {
    let scheduledDeparture: String
    var scheduledArrival: String 

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Spacer(minLength: 1)
                Text("Departure:")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                Text(scheduledDeparture)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer(minLength: 2)
                Text("Arrival:")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                Text(scheduledArrival)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer(minLength: 1)
            }
        }
    }
}

#Preview {
    TodayScheduleView( scheduledDeparture: "1:40 PM", scheduledArrival: "03:16 PM")
}

extension TodayScheduleView {
    init(quote: Quote) {
        scheduledDeparture = quote.legs[0].departure.scheduleTime
        scheduledArrival = quote.legs[0].arrival.scheduleTime
    }
}
