//
//  Weather.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation
// MARK: - Weather
struct Weather: Codable {
    let astronomy: [Astronomy]?
    let avgtempC, avgtempF, date: String?
    let hourly: [Hourly]?
    let maxtempC, maxtempF, mintempC, mintempF: String?
    let sunHour, totalSnowCM, uvIndex: String?

    enum CodingKeys: String, CodingKey {
        case astronomy, avgtempC, avgtempF, date, hourly, maxtempC, maxtempF, mintempC, mintempF, sunHour
        case totalSnowCM = "totalSnow_cm"
        case uvIndex
    }
}

