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
        VStack(spacing: 24) {
            Text("Aquí tienes tu tiempo en \(area?.areaName.first?.value ?? "Tu área seleccionada")")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Text("Weather Details")
                .font(.title)
            HStack {
                VStack {
                    Text("Temperatura: ")
                    Text("\(weather?.tempC ?? "_")ºC")
                    Image(.imgHot)
                        .resizable()
                        .shadow(radius: 10)
                        .frame(width: 80, height: 80)
                }
                VStack {
                    Text("Humedad: " )
                    Text(weather?.humidity ?? "_")
                }
            }
        }
        .padding()
        ScrollView(.horizontal, showsIndicators: false) { 
            HStack(spacing: 10) {
                ForEach(forecast?.forecastData ?? [], id: \.date) { data in
                    DetailViewCell(forecast: data)
                }
            }
        }
        //Text("¿Qué se espera el dia de hoy?")
        Text(weather?.weatherDesc.first?.value ?? "No hay descripción")
            .font(.title)
        Text("Vientos de: ")
        Text("\(weather?.windspeedKmph ?? "_")km/h")
    }
}

//#Preview {
//    DetailView(weather: .currentTest, forecast: <#Forecast?#>)
//}
