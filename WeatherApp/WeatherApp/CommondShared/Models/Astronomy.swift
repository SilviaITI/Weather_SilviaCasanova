//
//  Astronomy.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation
// MARK: - Astronomy
struct Astronomy: Codable {
    let moonIllumination, moonPhase, moonrise, moonset: String
    let sunrise, sunset: String

    enum CodingKeys: String, CodingKey {
        case moonIllumination = "moon_illumination"
        case moonPhase = "moon_phase"
        case moonrise, moonset, sunrise, sunset
    }
}


