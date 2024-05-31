//
//  Footer.swift
//  myBusJourney
//
//  Created by Shireesh Marla on 30/05/2024.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        Image(systemName: "bus.doubledecker")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundColor(.yellow)
            .padding(32)

    }
}

#Preview {
    Footer()
}
