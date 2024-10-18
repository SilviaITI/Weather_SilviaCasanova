//
//  Forecast.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation

struct Forecast: Codable {
    let forecastData: [ForecastData]
}

struct ForecastData: Codable {
    let date: String
    let maxTemp: String
    let minTemp: String
}
