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
                    Text("Introduce la ciudad que quieras consultar y pulsa la lupa")
                        .multilineTextAlignment(.center)
                    
                    CustomSearchBar(searchText: $viewModel.searchText, isSearchEnable: viewModel.enableSearchButton) {
                        viewModel.fetchWeatherData()
                    }
                    
                    Image(.umbrella)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .shadowContainer(radius: 20.0, borderColor: .mint)
                        .padding()
                }
                
                .navigationDestination(isPresented: $viewModel.showDetail) {
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
                    title: Text("error".localized),
                    message: Text(viewModel.alertText),
                    dismissButton: .default(Text("aceptar".localized))
                )
            }
    }
}

#Preview {
    HomeView()
}
