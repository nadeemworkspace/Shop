//
//  CustomViewModifier.swift
//  Shop
//
//  Created by Muhammed Nadeem on 31/12/25.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.sora(.regular, size: 14))
            .tint(Color.primaryColor)
            .padding(20)
            .background(Color.textFieldBackground)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .autocorrectionDisabled(true)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.5), lineWidth: 1)
            )
    }
    
}

struct NoAnimationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 1.0 : 1.0)
    }
}

struct NoAnimationButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(NoAnimationButtonStyle())
    }
}

// MARK: VIEW
extension View {
    
    func customTextField() -> some View {
        self.modifier(TextFieldModifier())
    }
    
    func noAnimationButton() -> some View {
        self.modifier(NoAnimationButtonModifier())
    }
    
}
