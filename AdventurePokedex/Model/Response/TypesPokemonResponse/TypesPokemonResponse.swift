//  TypesPokemonResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.

import Foundation

struct TypesPokemonResponse : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [TypePokemonResults]?
}

struct TypePokemonResults : Codable {
    let name : String?
    let url : String?
}
