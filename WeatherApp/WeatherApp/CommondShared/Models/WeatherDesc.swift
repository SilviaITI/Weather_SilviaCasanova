//
//  WeatherDesc.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation
struct WeatherDesc: Codable {
    let value: String?
}

extension WeatherDesc {
    static let wethTest = WeatherDesc(value: "Sunny")
}
