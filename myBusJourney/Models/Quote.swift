//
//  Quote.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import Foundation

struct Quote: Decodable, Identifiable, Hashable {
    var id: String {
        legs[0].tripUid
    }
    let legs: [Trip]
}

extension Quote {
    enum CodingKeys: String, CodingKey {
        case legs
    }
}
