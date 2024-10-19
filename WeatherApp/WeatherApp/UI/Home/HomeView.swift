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
    
    // MARK: - Principal View -
    var body: some View {
        NavigationStack {
            LoaderView(isLoading: $viewModel.isLoading) {
                
                VStack(spacing: 20) {
                    
                    simpleAlertContent
                    
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
                        .shadowContainer(radius: 20.0, borderColor: .mint)
                        .padding()
                }
                
                .navigationDestination(isPresented: $viewModel.showDetail){
                    DetailView(weather: viewModel.weatherInfo, area: viewModel.areaInfo, forecast: viewModel.forecast)
                }
                
            }
            
        }
    }
    
    // MARK: - View Components -
    @ViewBuilder
    private var simpleAlertContent: some View {
        ZStack {}
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text( "error".localized),
                    message: Text(viewModel.alertText),
                    dismissButton: .default(Text("aceptar".localized))
                )
            }
    }
    
}
#Preview {
    HomeView()
}
