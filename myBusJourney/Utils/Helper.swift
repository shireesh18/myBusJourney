//
//  File.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import Foundation

class Helper {
    static func currentDate(dateFormat: String) -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }

    static func extractTimeFromDate(_ scheduledDate: String) -> String {
        let dateFormatter = DateFormatter()

        // step 1
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+00:00" // input format
        let date = dateFormatter.date(from: scheduledDate)!

        // step 2
        dateFormatter.dateFormat = "hh:mm a" // output format
        let string = dateFormatter.string(from: date)
        return string
    }
}
