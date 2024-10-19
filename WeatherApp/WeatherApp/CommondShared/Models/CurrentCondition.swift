//
//  CurrentCondition.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation
// MARK: - CurrentCondition
struct CurrentCondition: Codable {
    let feelsLikeC, feelsLikeF, cloudcover, humidity: String?
    let localObsDateTime, observationTime, precipInches, precipMM: String?
    let pressure, pressureInches, tempC, tempF: String?
    let uvIndex, visibility, visibilityMiles, weatherCode: String?
    let weatherDesc: [WeatherDesc]?
    let winddir16Point, winddirDegree, windspeedKmph, windspeedMiles: String?
    var status: String?
    
    var tempImage: TemperatureState {
        let temperature = Double(tempC ?? "") ?? 0.0
           return getTemperatureState(for: temperature)
       }
    
    func getTemperatureState(for temperature: Double) -> TemperatureState {
        switch temperature {
        case ..<8:
            return .cold
        case 8...25:
            return .warm
        case 25...:
            return .hot
        default:
            return .unknown
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case cloudcover, humidity, localObsDateTime
        case observationTime = "observation_time"
        case precipInches, precipMM, pressure, pressureInches
        case tempC = "temp_C"
        case tempF = "temp_F"
        case uvIndex, visibility, visibilityMiles, weatherCode, weatherDesc
        case winddir16Point, winddirDegree, windspeedKmph, windspeedMiles
    }
    
    enum TemperatureState: String {
        case cold
        case warm
        case hot
        case unknown
      
        var image: String {
            switch self {
            case .cold:
                return "imgCold"
            case .warm:
                return "imgWarm"
            case .hot:
                return "imgHot"
            case .unknown:
                return "imgUnknown"
            }
        }
    }
}



    extension CurrentCondition {
        static let currentTest = CurrentCondition(
            feelsLikeC: "5ºC",
            feelsLikeF: "41ºF",
            cloudcover: "0",
            humidity: "80%",
            localObsDateTime: "2024-10-18 03:42 AM",
            observationTime: "07:42 AM",
            precipInches: "0.0",
            precipMM: "0.0",
            pressure: "1028",
            pressureInches: "30",
            tempC: "10ºC",
            tempF: "50ºF",
            uvIndex: "0",
            visibility: "10",
            visibilityMiles: "6",
            weatherCode: "113",
            weatherDesc: [WeatherDesc.wethTest], 
            winddir16Point: "NNE",
            winddirDegree: "12",
            windspeedKmph: "20km/h",
            windspeedMiles: "12"
        )
    }

