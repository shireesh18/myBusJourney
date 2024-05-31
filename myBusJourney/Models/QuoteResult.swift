//
//  QuoteResult.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import Foundation

struct QuoteResult: Decodable {
    let quotes : [Quote]
}

extension QuoteResult {
    enum CodingKeys: String, CodingKey {
        case quotes
    }
}

