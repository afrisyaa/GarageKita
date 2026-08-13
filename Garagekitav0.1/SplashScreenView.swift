//
//  SplashScreenView.swift
//  Garagekitav0.1
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var showMainView = false
    @State private var logoScale = 0.85
    @State private var logoOpacity = 0.0
    
    private let themeOrange = Color(red: 1.0, green: 0.67, blue: 0.0)
    private let themeBlue = Color(red: 0.02, green: 0.32, blue: 0.56)
    private let backgroundGrey = Color(red: 0.95, green: 0.95, blue: 0.97)
    
    var body: some View {
        ZStack {
            if showMainView {
                MainView()
                    .transition(.opacity)
            } else {
                splashContent
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showMainView)
        .onAppear {
            startSplashAnimation()
        }
    }
    
    // MARK: - Splash UI
    
    private var splashContent: some View {
        ZStack {
            backgroundGrey
                .ignoresSafeArea()
            
            ZStack {
                Image("logoScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
                    //.offset(x: 90, y:80)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                
                Text("GarageKita")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(themeBlue)
                    .offset(x: 20 ,y: 60)
                    .opacity(logoOpacity)
                /*
                Text("Your vehicle care companion")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.gray)
                    .opacity(logoOpacity) */
            }
            
            VStack {
                Spacer()
                /*
                Capsule()
                    .fill(themeOrange)
                    .frame(width: 90, height: 5)
                    .padding(.bottom, 48)
                    .opacity(logoOpacity) */
            }
        }
    }
    
    // MARK: - Animation
    
    private func startSplashAnimation() {
        withAnimation(.easeOut(duration: 0.6)) {
            logoScale = 1.0
            logoOpacity = 1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            showMainView = true
        }
    }
}

#Preview {
    SplashScreenView()
}
