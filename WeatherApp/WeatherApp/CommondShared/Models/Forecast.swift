//
//  Forecast.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation

struct Forecast: Codable {
    let forecastData: [ForecastData]?
}

struct ForecastData: Codable {
    let date: String?
    let maxTemp: String?
    let minTemp: String?
}

extension Forecast {
    static let forecastDataTest = ForecastData(date: "22/05/2029", maxTemp: "23", minTemp: "10")
    static let arrayForecastData = [forecastDataTest]
    static let forecastTest = Forecast(forecastData: arrayForecastData)
}
