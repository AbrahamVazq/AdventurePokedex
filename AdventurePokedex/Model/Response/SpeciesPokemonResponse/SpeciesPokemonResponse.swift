//  SpeciesPokemonResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import Foundation

struct SpeciesPokemonResponse : Codable {
    var evolution_chain : Evolution_chain?
}

struct Evolution_chain: Codable {
    var url : String?
}
