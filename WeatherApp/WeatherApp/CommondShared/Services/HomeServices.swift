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
    static func fetchWeather(city: String) async throws -> CurrentCondition {
        try await NetworkInterface.getWeather(city: city).response()
        
    }
    

}
