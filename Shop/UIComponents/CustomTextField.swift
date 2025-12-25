//
//  CustomTextField.swift
//  Shop
//
//  Created by Muhammed Nadeem on 21/12/25.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeHolder: String
    let keyboardType: UIKeyboardType
    
    init(text: Binding<String>, placeHolder: String, keyboardType: UIKeyboardType = .asciiCapable) {
        self._text = text
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
    }
    
    var body: some View {
        TextField("", text: $text, prompt: Text(placeHolder)
            .foregroundStyle(.white.opacity(0.5))
        )
        .font(.sora(.regular, size: 16))
        .tint(Color.primaryColor)
        .padding(20)
        .background(Color.textFieldBackground)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomTextField(text: .constant(""), placeHolder: "Enter your email.")
        .padding()
        .background(.red)
}
