//
//  LoginView.swift
//  Shop
//
//  Created by Muhammed Nadeem on 21/12/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var moveToLanding: Bool = false
    @State private var email: String = ""
    @State private var passWord: String = ""
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 80)
                logoView
                Spacer()
                VStack(spacing: 16) {
                    // Welcome back
                    titleAndSubTitle
                    // Email Textfield
                    CustomTextField(text: $email, placeHolder: "Enter your email", keyboardType: .emailAddress)
                    // Password Textfield
                    CustomTextField(text: $passWord, placeHolder: "Enter your password", keyboardType: .emailAddress)
                    // Sign In Button
                    PrimaryButton(title: "Log In") {
                        moveToLanding = true
                    }
                    .padding(.vertical)
                    // Sign up Button
                    signupButtonView
                }
                .padding()
                .background {
                    Color.black
                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16, topTrailingRadius: 16))
                        .ignoresSafeArea(edges: .bottom)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    dismiss()
                }
            }
        }
        .navigationDestination(isPresented: $moveToLanding) {
            LandingView()
        }
    }
}

// MARK: SUBVIEW
extension LoginView {
    
    @ViewBuilder
    private var logoView: some View {
        Image(.logo)
            .resizable()
            .scaledToFit()
            .frame(width: 130, height: 50)
    }
    
    @ViewBuilder
    private var titleAndSubTitle: some View {
        VStack(spacing: 10) {
            Text("Welcome Back!")
                .font(.sora(.semibold, size: 26))
                .foregroundStyle(.white)
            Text("Lets get you back onboard.")
                .font(.sora(.regular, size: 14))
                .foregroundStyle(.white.opacity(0.7))
                .padding(.bottom)
        }
    }
    
    @ViewBuilder
    private var signupButtonView: some View {
        Button {
            print("Signup button")
        } label: {
            HStack(alignment: .center) {
                Text("Dont have an account?")
                    .foregroundStyle(.white)
                    .font(.sora(.regular, size: 12))
                Text("Sign Up")
                    .foregroundStyle(Color.primaryColor)
                    .font(.sora(.semibold, size: 12))
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
