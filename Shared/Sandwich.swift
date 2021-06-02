//
//  Sandwich.swift
//  SampleSwiftUI
//
//  Created by hyunsu on 2021/06/02.
//

import Foundation


struct Sandwich: Identifiable {
    private let NAME = "sandwich"
    var id = UUID()
    var name: String
    var isSpicy: Bool
    var ingredientsCount: Int
    var thumbNail: String { NAME + "Thumbnail"}
    var image: String {NAME}
    var ingredients: String { " \(ingredientsCount) ingredients " }
}

let testData = [
    Sandwich(name: "sandwich", isSpicy: true, ingredientsCount: 5),
    Sandwich(name: "hot sandwich", isSpicy: false, ingredientsCount: 1),
    Sandwich(name: "fish sandwich", isSpicy: false, ingredientsCount: 10),
    Sandwich(name: "hotdog sandwich", isSpicy: true, ingredientsCount: 12),
    Sandwich(name: "delicious sandwich", isSpicy: true, ingredientsCount: 13),
    Sandwich(name: "good! sandwich", isSpicy: true, ingredientsCount: 5),
    Sandwich(name: "sandwich", isSpicy: true, ingredientsCount: 5),
]


