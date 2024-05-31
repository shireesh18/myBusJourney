//
//  QuotesViewModel.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 29/05/2024.
//

import Foundation

@Observable
class QuotesViewModel {
    var quotes: [Quote] = []

    func fetchQuotes() async throws {
        let currentDateTime = Helper.currentDate(dateFormat: "yyyy-MM-dd HH:mm:ss")
        let currentDate = Helper.currentDate(dateFormat: "yyyy-MM-dd")

        let url = URL(string: "https://api.ember.to/v1/quotes/?origin=13&destination=42&departure_date_from=\(currentDateTime)z&departure_date_to=\(currentDate)T23:59:00.000z")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(QuoteResult.self, from: data)
            quotes = result.quotes
    }


}

