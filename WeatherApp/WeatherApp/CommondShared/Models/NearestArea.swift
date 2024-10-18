//
//  NearestArea.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation

// MARK: - NearestArea
struct NearestArea: Codable {
    let areaName: [AreaName]
    let country: [Country]
   

    enum CodingKeys: String, CodingKey {
        case areaName = "areaName"
        case country
 
    }
}

// MARK: - AreaName
struct AreaName: Codable {
    let value: String?
}
struct Country: Codable {
    let value: String?
}


