//
//  HomeView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties -
    @StateObject var viewModel = HomeViewModel()
    @State var text = ""
    @State private var selectedWeather: CurrentCondition?
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Introduce una ciudad y pulsa la lupa...")
                    .font(.largeTitle)
                    CustomSearchBar(searchText: $viewModel.searchText, isSearchEnable: viewModel.enableSearchButton) {
                        Task {
                            await viewModel.fetchWeather()
                        }
                        if let weather = viewModel.weatherInfo {
                            selectedWeather = weather
                            
                        }
                        
                    }
                }
                .padding()
                .navigationDestination(isPresented: $viewModel.showDetail){
                    DetailView(weather: viewModel.weatherInfo)
                }
            }
        }
    }

#Preview {
    HomeView()
}
