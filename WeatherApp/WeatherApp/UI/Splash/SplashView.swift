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
        ZStack {
            Text("splash_title".localized)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.mint)
            Image(.imgSplash)
                .resizable()
                .scaledToFill()
                .opacity(0.2)
                .ignoresSafeArea()
                .padding()
                .scaleEffect(isAnimating ? 1.0 : 0.1)
                .animation(.easeInOut(duration: 3), value: isAnimating)
                .padding(.horizontal, 40)
                .onAppear(perform: startAnimation)
        }
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
