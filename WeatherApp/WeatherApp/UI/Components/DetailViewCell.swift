//
//  DetailViewCell.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import SwiftUI

struct DetailViewCell: View {
    
    let forecast: ForecastData
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.mint.opacity(0.5))
            .frame(width: 200, height: 150)
            .overlay(
                VStack {
                    if let formattedDate = String.dateFormat(originalDateString: forecast.date) {
                        Text(formattedDate)
                            .font(.subheadline)
                    } else {
                        Text(forecast.date)
                            .font(.subheadline)
                    }
                    HStack {
                        VStack {
                            Text("Max")
                            Text("\(forecast.maxTemp)ºC")
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("Min")
                            Text("\(forecast.minTemp)ºC")
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                    .padding()
                    .foregroundColor(.black)
            )
            .padding()
    }
}
//#Preview {
//    DetailViewCell()
//}
