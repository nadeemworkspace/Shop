//
//  SplashView.swift
//  Shop
//
//  Created by Muhammed Nadeem on 19/12/25.
//

import SwiftUI

struct SplashView: View {
    
    @State private var moveToAppTourView: Bool = false
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 45)
                Spacer()
            }
            .overlay(alignment: .bottom) {
                loaderView
                    .padding(.bottom, 50)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                moveToAppTourView = true
            }
        }
        .navigationDestination(isPresented: $moveToAppTourView) {
            AppTourView()
        }
    }
}

// MARK: SUBVIEWS
extension SplashView {
    
    @ViewBuilder
    private var loaderView: some View {
        Group {
            ProgressView()
                .transition(.opacity)
        }
        .padding(.top, 30)
    }
    
}

#Preview {
    SplashView()
}
