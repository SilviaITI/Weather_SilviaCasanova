//
//  DetailView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import SwiftUI

struct DetailView: View {
    let weather: CurrentCondition?
    let area: NearestArea?
    let forecast: Forecast?
    
    var body: some View {
        VStack {
            Text("Aquí tienes tu tiempo en \(area?.areaName.first?.value ?? "Tu área seleccionada")")
            Text("Weather Details")
                .font(.title)
            Text("Temperatura: ")
            Text("\(weather?.tempC ?? "_")ºC")
            Text("Humidity: " )
            Text(weather?.humidity ?? "_")
        }
        .padding()
        ScrollView(.horizontal, showsIndicators: false) { 
            HStack(spacing: 10) {
                ForEach(forecast?.forecastData ?? [], id: \.date) { data in
                    DetailViewCell(forecast: data)
                }
            }
        }
        Text("¿Qué se espera el dia de hoy?")
        Text(weather?.weatherDesc.first?.value ?? "No hay descripción")
        Text("Vientos de: ")
        Text("\(weather?.windspeedKmph ?? "_")km/h")
    }
}

//#Preview {
//    DetailView(weather: .currentTest, forecast: <#Forecast?#>)
//}
