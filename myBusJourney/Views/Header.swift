//
//  Heading.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 28/05/2024.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 8) {
                Text("From:")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("GreenMarket, Dundee")
                    .font(.system(size: 12))
                    .dynamicTypeSize(.large)
                    .foregroundStyle(.secondary)
                    .fontWeight(.bold)
            }
            VStack(alignment:.leading, spacing: 8) {
                Text("To:")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("St Andrew Square, Edinburgh")
                    .font(.system(size: 12))
                    .dynamicTypeSize(.large)
                    .foregroundStyle(.secondary)
                    .fontWeight(.bold)
            }
        }
        .dynamicTypeSize(.xLarge)
        .padding()
    }
}

#Preview {
    Header()
}
