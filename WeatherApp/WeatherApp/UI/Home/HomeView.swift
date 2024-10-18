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
        
                VStack {
                    Spacer()
                    Text("Consulta la previsión del tiempo")
                        .font(.largeTitle)
                        .bold()
                    CustomSearchBar(searchText: $viewModel.searchText, isSearchEnable: viewModel.enableSearchButton) {
                        Task {
                            await viewModel.fetchWeather()
                            await viewModel.fetchForecast()
                        }
                    }
                    Spacer()
                    Image(.umbrella)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 3000, height: 200)
                        .shadowContainer(radius: 20.0, borderColor: .mint)
                }
                .padding()
                .navigationDestination(isPresented: $viewModel.showDetail){
                    DetailView(weather: viewModel.weatherInfo, area: viewModel.areaInfo, forecast: viewModel.forecast)
                }
            }
        }
}
#Preview {
    HomeView()
}
