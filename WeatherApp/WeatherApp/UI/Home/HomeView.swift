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
                    
                    titleDescription
                    
                    CustomSearchBar(searchText: $viewModel.searchText, isSearchEnable: viewModel.enableSearchButton) {
                        viewModel.fetchWeatherData()
                    }
                    
                    Image(.umbrella)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 200)
                        .shadowContainer(radius: 20.0, borderColor: .mint)
                        .padding()
                }
                
                .navigationDestination(isPresented: $viewModel.showDetail) {
                    DetailView(weather: viewModel.weatherInfo,
                               area: viewModel.areaInfo,
                               forecast: viewModel.forecast)
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
                    dismissButton: .default(Text("action_accept".localized))
                )
            }
    }
    
    private var titleDescription: some View {
        VStack {
            Text("home_title".localized)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            Text("home_subtitle".localized)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    HomeView()
}
