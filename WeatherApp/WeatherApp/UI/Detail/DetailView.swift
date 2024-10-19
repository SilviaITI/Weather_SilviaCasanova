//
//  DetailView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties -
    let weather: CurrentCondition?
    let area: NearestArea?
    let forecast: Forecast?
    
    // MARK: - Principal View -
    var body: some View {
        weatherInfo
        Text("Previsión para los próximos días")
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(forecast?.forecastData ?? [], id: \.date) { data in
                    DetailViewCell(forecast: data)
                }
            }
        }
        Text(weather?.weatherDesc.first?.value ?? "No hay descripción")
            .font(.title)
        Text("Vientos de: ")
        Text("\(weather?.windspeedKmph ?? "_")km/h")
    }
    
    @ViewBuilder
    private var weatherInfo: some View {
        VStack(spacing: 24) {
            Text("Aquí tienes tu tiempo en \(area?.areaName.first?.value ?? "Tu área seleccionada")")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            HStack {
                VStack {
                    Text("Temperatura: ")
                    Image(weather?.tempImage.image ?? "imgWarm")
                        .resizable()
                        .shadow(radius: 10)
                        .frame(width: 80, height: 80)
                    Text("\(weather?.tempC ?? "_")ºC")
                }
                
                VStack {
                    Text("Humedad: " )
                    Image(.imgHumidity)
                        .resizable()
                        .shadow(radius: 10)
                        .frame(width: 60, height: 80)
                    Text("\(weather?.humidity ?? "_")%")
                }
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(weather: .currentTest, area: .nearestTest, forecast: .forecastTest)
}
