//
//  HomeServices.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation


struct HomeServices {
    /// Método que hará la llamada la networkInterface para obtener la lista de los personjes con paginado
    /// - Returns: Objeto ApiResponse que contiene un objeto Info para el paginado y un objeto Results que es un array de personajes
    static func fetchWeather(city: String) async throws -> WeatherResponse {
        
        try await NetworkInterface.getWeather(city: city).response()
        
        
    }
    
    static func fetchForecast(city: String) async throws -> Forecast {
        let weatherResponse: WeatherResponse = try await NetworkInterface.getWeather(city: city).response()
        let forecastData = weatherResponse.weather?.compactMap { weather in
         
            ForecastData(date: weather.date, maxTemp: weather.maxtempC, minTemp: weather.mintempC)
        }
        return Forecast(forecastData: forecastData)
    }
}


    


