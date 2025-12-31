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

// MARK: VIEW
extension View {
    
    func customTextField() -> some View {
        self.modifier(TextFieldModifier())
    }
    
}
