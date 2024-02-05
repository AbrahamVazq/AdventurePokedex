//  SpritesPokemonResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 04/02/24.

import Foundation

struct SpritesPokemonResponse : Codable {
    var sprites : SpritesResponse?
    var id: Int?
    var weight : Int?
    var height : Int?
    var name: String?
}
