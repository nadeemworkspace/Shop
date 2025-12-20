//
//  CustomFont.swift
//  Shop
//
//  Created by Muhammed Nadeem on 20/12/25.
//

import SwiftUI

extension Font {
    
    enum AppFont: String {
        case bold = "Sora-Bold"
        case medium = "Sora-Medium"
        case regular = "Sora-Regular"
        case semibold = "Sora-SemiBold"
        case light = "Sora-Light"
    }
    
    static func sora(_ font: AppFont, size: CGFloat) -> Font {
        .custom(font.rawValue, size: size)
    }
    
}
