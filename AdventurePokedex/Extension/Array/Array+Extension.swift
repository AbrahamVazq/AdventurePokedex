//  Array+Extension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 04/02/24.

import Foundation

extension Array {
    func returnSprites(fromSprites sprites: SpritesResponse ) -> [String] {
        var aux: [String] = []
        aux.append(sprites.front_default ?? "")
        aux.append(sprites.back_default ?? "")
        aux.append(sprites.front_shiny ?? "")
        aux.append(sprites.back_shiny ?? "")
        return aux
    }
    
    subscript (safe index: Index) -> Element? {
        .zero <= index && index < count ? self[index] : nil
    }
}
