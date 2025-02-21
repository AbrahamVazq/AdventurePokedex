//  RegionDetailResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/02/25.

import Foundation

struct RegionDetailResponse : Codable {
    var id : Int?
    var name : String?
    var pokemon_entries : [Pokemon_entries]?
}

struct Pokemon_entries : Codable {
    var entry_number : Int?
    var pokemon_species : PokeGeneral?
}
