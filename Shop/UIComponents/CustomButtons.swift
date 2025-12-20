//
//  CustomButtons.swift
//  Shop
//
//  Created by Muhammed Nadeem on 20/12/25.
//

import SwiftUI

// Primary Button
struct PrimaryButton: View {
    
    let title: String
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(title)
                .font(.sora(.semibold, size: 16))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryButton(title: "Next") {
        print("Action....!")
    }
    .padding()
}
