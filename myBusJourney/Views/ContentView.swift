//
//  ContentView.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var model = QuotesViewModel()

    var body: some View {
        VStack {
            Header()
                .padding()
            ListView(quotes: model.quotes)
            Footer()
            .task {
                try? await model.fetchQuotes()
            }.refreshable {
                try? await model.fetchQuotes()
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
