//
//  AppTourView.swift
//  Shop
//
//  Created by Muhammed Nadeem on 19/12/25.
//

import SwiftUI

struct AppTourView: View {

    private let data = TourModel.displayData
    @State private var currentIndex: Int = 0

    private var currentData: TourModel {
        data[currentIndex]
    }

    var body: some View {
        ZStack {
            // Background color
            Color.appBackground
                .ignoresSafeArea()
            VStack {
                // Shop Logo
                logo
                // Image View
                scrollableContainerView
                Spacer()
                // Page Indicator
                pageIndicator
                // Details with Button
                detailsView
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}


// MARK: SUBVIEWS
extension AppTourView {
    
    @ViewBuilder
    private var logo: some View {
        Image(.logo)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 40)
            .padding(.top, 5)
    }
    
    @ViewBuilder
    private var scrollableContainerView: some View {
        TabView(selection: $currentIndex) {
            ForEach(data.indices, id: \.self) { index in
                Image(data[index].image)
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding()
    }

    // Page Indicator
    @ViewBuilder
    private var pageIndicator: some View {
        HStack {
            ForEach(data.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 3)
                    .fill(index == currentIndex ? Color.primaryColor : Color.white.opacity(0.4))
                    .frame(width: index == currentIndex ? 16 : 6, height: 6)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: currentIndex)
        .padding(.vertical)
    }
    
    // Detail View
    private var detailsView: some View {
        VStack {
            // Title
            titleAndDescription
            // Next/ Get Started button
            PrimaryButton(title: currentIndex == data.count - 1 ? "Get Started" : "Next") {
                nextPage()
            }
            .padding(.vertical)
            // Sign In
            signInButton
        }
        .padding()
        .frame(height: 300)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    @ViewBuilder
    private var titleAndDescription: some View {
        VStack {
            Text(currentData.title)
                .foregroundStyle(.white)
                .font(.sora(.bold, size: 26))
                .padding(.vertical)

            Text(currentData.description)
                .font(.sora(.light, size: 14))
                .foregroundStyle(.white.opacity(0.7))
                .kerning(0.4)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
        .id(currentIndex)
        .animation(.spring, value: currentIndex)
        .frame(height: 130)
    }
    
    @ViewBuilder
    private var signInButton: some View {
        Button {
            print("Sign In")
        } label: {
            HStack(alignment: .center) {
                Text("Already have an account?")
                    .foregroundStyle(.white)
                    .font(.sora(.regular, size: 12))
                Text("Sign In")
                    .foregroundStyle(Color.primaryColor)
                    .font(.sora(.semibold, size: 12))
            }
        }
        .safeAreaPadding(.bottom, 20)
    }

    private func nextPage() {
        if currentIndex < data.count - 1 {
            currentIndex += 1
        } else {
            print("Finished tour")
        }
    }

}

#Preview {
    AppTourView()
}
