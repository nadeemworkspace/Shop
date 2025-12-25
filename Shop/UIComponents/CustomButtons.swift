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
                .padding(20)
                .background(Color.primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

struct BackButton: View {
    let completion: () -> Void
    var body: some View {
        HStack {
            Button {
                completion()
            } label: {
                Image("backButton")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .contentShape(Rectangle())
            }
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PrimaryButton(title: "Next") {
        print("Action....!")
    }
    .padding()
}
