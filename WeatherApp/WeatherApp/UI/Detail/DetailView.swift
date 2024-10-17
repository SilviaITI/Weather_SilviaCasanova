//
//  DetailView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import SwiftUI

struct DetailView: View {
    let weather: CurrentCondition?
    
    var body: some View {
        VStack {
            Text("Weather Details")
                .font(.title)
            Text("Temperature: \( weather?.tempC)")
            Text("Humidity: \(weather?.humidity ?? "_")")
        }
        .padding()
    }
}

#Preview {
    DetailView(weather: .currentTest)
}
