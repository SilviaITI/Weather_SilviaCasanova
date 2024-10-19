//
//  SplashView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 18/10/24.
//

import SwiftUI

// MARK: - Enum -
enum ViewState {
    case splash
    case home
}

struct SplashView: View {
    
    // MARK: - Properties -
    @State private var isAnimating = false
    @State private var viewState: ViewState = .splash
    
    // MARK: - Principal View -
    var body: some View {
        NavigationStack {
            switch viewState {
            case .splash:
                splashContent
            case .home:
                HomeView()
            }
        }
    }
    
    // MARK: - View Components -
    @ViewBuilder
    private var splashContent: some View {
        
        Image(.umbrellaSplash)
            .resizable()
            .scaledToFill()
            .scaleEffect(isAnimating ? 1.0 : 0.1)
            .animation(.easeInOut(duration: 3), value: isAnimating)
            .padding()
            .onAppear(perform: startAnimation)
    }
}

// MARK: - View Extensions -
extension SplashView {
    private func startAnimation() {
        withAnimation {
            isAnimating = true
        }
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            viewState = .home
        }
    }
}

#Preview {
    SplashView()
}
