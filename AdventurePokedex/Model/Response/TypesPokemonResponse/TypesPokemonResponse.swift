//  TypesPokemonResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.

import Foundation

struct TypesPokemonResponse : Codable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [PokeGeneral]?
}
