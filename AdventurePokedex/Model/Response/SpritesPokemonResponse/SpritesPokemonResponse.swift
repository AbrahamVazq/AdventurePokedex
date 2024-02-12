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
    var types: [PokemonTypes]?
}

struct PokemonTypes: Codable {
    var slot: Int?
    var type: PokemonType?
}

struct PokemonType: Codable {
    var name: String?
    var url: String?
}
