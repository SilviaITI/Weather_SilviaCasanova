//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation
final class HomeViewModel: ObservableObject {
    
// MARK: - Properties -
 var weatherInfo: CurrentCondition?
@Published var searchText = ""
@Published var alertText = ""
@Published var isLoading = false
@Published var showAlert = false
@Published var enableSearchButton = true
@Published var showDetail = false
// MARK: - API Methods -
/// Método para traer el listado de todos los personajes y comprueba si existe una página siguiente para mostrarla
@MainActor
func fetchWeather() async {
    do {
        let response = try await HomeServices.fetchWeather(city: searchText)
        showDetail = true
        
    } catch(let error) {
        if let apiError = error as? APIErrors {
            alertText = apiError.description
            showAlert = true
        }
    }
    isLoading = false
}



}
