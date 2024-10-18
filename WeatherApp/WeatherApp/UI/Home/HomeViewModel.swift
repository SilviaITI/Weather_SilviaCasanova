//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation
final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties -
    @Published var weatherInfo: CurrentCondition?
    @Published var areaInfo: NearestArea?
    @Published var searchText = ""
    @Published var alertText = ""
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var enableSearchButton = true
    @Published var showDetail = false
    @Published var forecast: Forecast?
    
    // MARK: - API Methods -
    /// Método para traer el listado de todos los personajes y comprueba si existe una página siguiente para mostrarla
    @MainActor
    func fetchWeather() async {
        isLoading = true
        do {
               let response = try await HomeServices.fetchWeather(city: searchText)
               
               if let currentCondition = response.currentCondition.first {
                   weatherInfo = currentCondition
               }

               if let nearestArea = response.nearestArea.first {
                   areaInfo = nearestArea
               }
            
            showDetail = true
        } catch(let error) {
            if let apiError = error as? APIErrors {
                alertText = apiError.description
                showAlert = true
            }
        }
        isLoading = false
    }
    @MainActor
    func fetchForecast() async {
        isLoading = true
        do {
            let response = try await HomeServices.fetchForecast(city: searchText)
            forecast = response
            showDetail = true
        } catch {
            if let apiError = error as? APIErrors {
                alertText = apiError.description
                showAlert = true
            }
        }
        isLoading = false
        
    }
}
