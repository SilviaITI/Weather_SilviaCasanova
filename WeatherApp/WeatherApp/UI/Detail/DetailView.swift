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
            Text(String(format: "detail_title".localized, area?.areaName?.first?.value ?? "detail_default_area".localized))
                .font(.title)
                .padding()
                .multilineTextAlignment(.center)
            HStack {
                VStack {
                    Text("detail_temperature".localized)
                    Image(weather?.tempImage.image ?? "imgWarm")
                        .resizable()
                        .shadow(radius: 10)
                        .frame(width: 80, height: 80)
                    Text("\(weather?.tempC ?? "_")ºC")
                }
                
                VStack {
                    Text("detail_humidity".localized )
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
            Text("detail_subtitle".localized)
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
                Text(weather?.weatherDesc?.first?.value ?? "detail_no_description".localized)
                    .font(.title)
                Text(String(format: "detail_wind".localized, weather?.windspeedKmph ?? ""))
                Map(coordinateRegion: $region)
                    .onAppear {
                        region = MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: Double(area?.latitude ?? "") ?? 0.0,
                                                           longitude: Double(area?.longitude ?? "") ?? 0.0),
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    }
                    .frame(height: 200)
                    .disabled(true)
            }
        }
    }
}

#Preview {
    DetailView(weather: .currentTest, area: .nearestTest, forecast: .forecastTest)
}
