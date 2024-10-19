//
//  DetailView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    // MARK: - Properties -
    let weather: CurrentCondition?
    let area: NearestArea?
    let forecast: Forecast?
    @State private var region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
          span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
      )
    
    // MARK: - Principal View -
    var body: some View {
        ScrollView {
            weatherInfo
            
            forecastInfo
          
            weatherDesc
            
        }
    }
    
    @ViewBuilder
    private var weatherInfo: some View {
        VStack(spacing: 24) {
            Text("Aquí tienes tu tiempo en \(area?.areaName?.first?.value ?? "Tu área seleccionada")")
                .font(.title)
                .padding()
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
    
    private var forecastInfo: some View {
        VStack {
            Text("Previsión para los próximos días")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(forecast?.forecastData ?? [], id: \.date) { data in
                        DetailViewCell(forecast: data)
                    }
                }
            }
        }
    }
    
    private var weatherDesc: some View {
        HStack {
            VStack {
                Text(weather?.weatherDesc?.first?.value ?? "No hay descripción")
                    .font(.title)
                Text("Vientos de: \(weather?.windspeedKmph ?? "")")
                Map(coordinateRegion: $region)
                    .onAppear {
                        let lat = Double(area?.latitude ?? "") ?? 0.0
                        let lon = Double(area?.longitude ?? "") ?? 0.0
                        
                        region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: lat, longitude: lon),
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    }
                    .frame(height: 200)
                    .disabled(true)
            }
        }
    }
    
}

//#Preview {
//    DetailView(weather: .currentTest, area: .nearestTest, forecast: .forecastTest)
//}
