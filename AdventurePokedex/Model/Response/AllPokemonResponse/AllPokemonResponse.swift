//  AllPokemonResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import Foundation

struct AllPokemonResponse : Codable {
    var descriptions : [AllPokemonDescriptions]?
    var id : Int?
    var isMainSeries : Bool?
    var name : String?
    var names : [AllPokemonNames]?
    var pokemonEntries : [AllPokemonEntries]?
    var region : String?
    var versionGroups : [String]?

    enum CodingKeys: String, CodingKey {
        case descriptions = "descriptions"
        case id = "id"
        case isMainSeries = "is_main_series"
        case name = "name"
        case names = "names"
        case pokemonEntries = "pokemon_entries"
        case region = "region"
        case versionGroups = "version_groups"
    }

}
