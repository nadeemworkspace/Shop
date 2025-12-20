//
//  TourModel.swift
//  Shop
//
//  Created by Muhammed Nadeem on 20/12/25.
//

import Foundation

struct TourModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
}

extension TourModel {
    
    static let displayData: [Self] = [
        .init(image: "tour1", title: "Discover Our Products", description: "Browse thousands of products, from fashion to tech. Find what you love, effortlessly."),
        .init(image: "tour2", title: "Hassle-Free Checkout", description: "Seamless payments and speedy delivery. Start shopping smarter today."),
        .init(image: "tour3", title: "Easy and Happy Shopping", description: "Start shopping now and enjoy a world of convenience!")
    ]
    
}
