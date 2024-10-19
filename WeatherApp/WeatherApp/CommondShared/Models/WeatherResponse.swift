//
//  DataModel.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation
struct WeatherResponse: Codable {
    let currentCondition: [CurrentCondition]?
    let nearestArea: [NearestArea]?
    let request: [RequestModel]?
    let weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case currentCondition = "current_condition"
        case nearestArea = "nearest_area"
        case request, weather
    }
}

