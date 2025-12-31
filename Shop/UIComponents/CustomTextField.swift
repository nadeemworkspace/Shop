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
    let isSecuredField: Bool
    let keyboardType: UIKeyboardType
    
    init(text: Binding<String>, placeHolder: String, isSecuredField: Bool = false, keyboardType: UIKeyboardType = .asciiCapable) {
        self._text = text
        self.placeHolder = placeHolder
        self.isSecuredField = isSecuredField
        self.keyboardType = keyboardType
    }
    
    var body: some View {
        Group {
            if isSecuredField {
                SecureField("", text: $text, prompt: Text(placeHolder)
                    .foregroundStyle(.white.opacity(0.5))
                )
            } else {
                TextField("", text: $text, prompt: Text(placeHolder)
                    .foregroundStyle(.white.opacity(0.5))
                )
                .keyboardType(keyboardType)
            }
        }
        .customTextField()
        .keyboardType(keyboardType)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomTextField(text: .constant(""), placeHolder: "Enter your email.")
        .padding()
        .background(.red)
}
