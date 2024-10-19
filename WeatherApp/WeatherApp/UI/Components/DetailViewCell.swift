//
//  DetailViewCell.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import SwiftUI

struct DetailViewCell: View {
    
    // MARK: - Properties -
    let forecast: ForecastData
    
    // MARK: - Principal View -
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.mint.opacity(0.5))
            .frame(width: 200, height: 150)
            .overlay(
             dataInfo
            )
            .padding()
    }
    
    var temperatureSection: some View {
        HStack {
            VStack {
                Text("detail_cell_max".localized)
                Text("\(forecast.maxTemp ?? "")ºC")
                    .font(.title)
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Text("detail_cell_min".localized)
                Text("\(forecast.minTemp ?? "")ºC")
                    .font(.title)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var dataInfo: some View {
        VStack {
            Text(forecast.date?.dateFormat ?? "")
                .font(.subheadline)
            temperatureSection
        }
            .padding()
            .foregroundColor(.black)
    }
}


#Preview {
    DetailViewCell(forecast: Forecast.forecastDataTest)
}
