//
//  HomeServices.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation


struct HomeServices {
    /// Method that calls networkinterface to get the weather forecast  paginado
    /// - Returns: WeatherResponse object that contains an object with meteorological information
    static func fetchWeather(city: String) async throws -> WeatherResponse {
        
        try await NetworkInterface.getWeather(city: city).response()
        
        
    }
}


    


