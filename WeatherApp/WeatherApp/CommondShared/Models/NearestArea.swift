//
//  NearestArea.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import Foundation


struct NearestArea: Codable {
    let areaName: [AreaName]?
    let country: [Country]?
    let latitude: String?
    let longitude: String?
    

    enum CodingKeys: String, CodingKey {
        case areaName = "areaName"
        case country
        case latitude
        case longitude
 
    }
}


struct AreaName: Codable {
    let value: String?
}
struct Country: Codable {
    let value: String?
}


extension NearestArea {
    static let nearestTest = NearestArea(
        areaName: [AreaName(value: "París")],
        country: [Country(value: "Francia")],
        latitude: "2.6",
        longitude: "3.7"
    )
}


