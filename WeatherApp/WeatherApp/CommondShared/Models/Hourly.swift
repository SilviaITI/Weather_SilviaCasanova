//
//  Hourly.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation
// MARK: - Hourly
struct Hourly: Codable {
    let dewPointC, dewPointF, feelsLikeC, feelsLikeF: String?
    let heatIndexC, heatIndexF, windChillC, windChillF: String?
    let windGustKmph, windGustMiles, chanceoffog, chanceoffrost: String?
    let chanceofhightemp, chanceofovercast, chanceofrain, chanceofremdry: String?
    let chanceofsnow, chanceofsunshine, chanceofthunder, chanceofwindy: String?
    let cloudcover, diffRAD, humidity, precipInches: String?
    let precipMM, pressure, pressureInches, shortRAD: String?
    let tempC, tempF, time, uvIndex: String?
    let visibility, visibilityMiles, weatherCode: String?
    let weatherDesc, weatherIconURL: [WeatherDesc]?
    let winddir16Point, winddirDegree, windspeedKmph, windspeedMiles: String?

    enum CodingKeys: String, CodingKey {
        case dewPointC = "DewPointC"
        case dewPointF = "DewPointF"
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case heatIndexC = "HeatIndexC"
        case heatIndexF = "HeatIndexF"
        case windChillC = "WindChillC"
        case windChillF = "WindChillF"
        case windGustKmph = "WindGustKmph"
        case windGustMiles = "WindGustMiles"
        case chanceoffog, chanceoffrost, chanceofhightemp, chanceofovercast, chanceofrain, chanceofremdry, chanceofsnow, chanceofsunshine, chanceofthunder, chanceofwindy, cloudcover
        case diffRAD = "diffRad"
        case humidity, precipInches, precipMM, pressure, pressureInches
        case shortRAD = "shortRad"
        case tempC, tempF, time, uvIndex, visibility, visibilityMiles, weatherCode, weatherDesc
        case weatherIconURL = "weatherIconUrl"
        case winddir16Point, winddirDegree, windspeedKmph, windspeedMiles
    }
}
