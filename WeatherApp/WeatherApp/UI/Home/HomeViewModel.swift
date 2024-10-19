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
    
    // MARK: - Public Methods -
    /// Method that calls other methods to avoid publishing changes during view updates.
    func fetchWeatherData() {
        Task {
            await fetchWeather()
        }
    }
    // MARK: - Private Methods -
    private func loadData(_ data: WeatherResponse) {
        if let currentCondition = data.currentCondition?.first {
            weatherInfo = currentCondition
        }
        
        if let nearestArea = data.nearestArea?.first {
            areaInfo = nearestArea
        }
        
        let forecastData = data.weather?.compactMap { weather in
            ForecastData(date: weather.date, maxTemp: weather.maxtempC, minTemp: weather.mintempC)
        }
        
        forecast = Forecast(forecastData: forecastData)
    }
    
    // MARK: - API Methods -
    /// Method for fetching weather information
     @MainActor
    private func fetchWeather() async {
        isLoading = true
        do {
            let response = try await HomeServices.fetchWeather(city: searchText)
            
            loadData(response)
            
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
