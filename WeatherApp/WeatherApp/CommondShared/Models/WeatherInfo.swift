//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation
struct WeatherInfo: Codable {
    let astronomy: [Astronomy]?
    let avgtempC: Int?
    let avgtempF: Int?
    let date: String?
    

    enum CodingKeys: String, CodingKey {
        case astronomy
        case avgtempC
        case avgtempF
        case date
        
    }
}
