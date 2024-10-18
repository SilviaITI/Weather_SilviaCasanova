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
    
    var body: some View {
        NavigationStack {
            LoaderView(isLoading: $viewModel.isLoading) {
                
                VStack(spacing: 20) {
                    Text("Consulta la previsión del tiempo")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    CustomSearchBar(searchText: $viewModel.searchText, isSearchEnable: viewModel.enableSearchButton) {
                        Task {
                            await viewModel.fetchWeather()
                            await viewModel.fetchForecast()
                        }
                    }
                    Image(.umbrella)
                        .resizable()
                        .scaledToFit()
                        //.frame(height: 300)
                        .shadowContainer(radius: 20.0, borderColor: .mint)
                        .padding()
                }
                
                .navigationDestination(isPresented: $viewModel.showDetail){
                    DetailView(weather: viewModel.weatherInfo, area: viewModel.areaInfo, forecast: viewModel.forecast)
                }
               
            }
            
        }
    }
        
}
#Preview {
    HomeView()
}
