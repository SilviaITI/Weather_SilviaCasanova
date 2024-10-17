//
//  CurrentCondition.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation
struct CurrentCondition: Codable {
    
    let tempC: String?
    let humidity: String?
    let weatherDesc: WeatherDesc?
    let localObsDateTime: String?
    let windSpeedKmph: String?
    
    enum CodingKeys: String, CodingKey {
          case tempC = "temp_C"            
          case humidity = "humidity"
          case weatherDesc = "weatherDesc"
          case localObsDateTime = "localObsDateTime"
          case windSpeedKmph = "windspeedKmph"
      }
}

extension CurrentCondition {
    static let currentTest = CurrentCondition(tempC: "16º", humidity: "80%", weatherDesc: .wethTest, localObsDateTime: "13/06/24", windSpeedKmph: "20km/h")
}
