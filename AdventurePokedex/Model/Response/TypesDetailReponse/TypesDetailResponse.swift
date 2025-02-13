//  TypesDetailResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.

import Foundation

struct TypesDetailResponse : Codable {
    var id : Int?
    var name : String?
    var damageRelations : DamageRelations?
    
    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
    }
}

struct DamageRelations : Codable {
    var double_damage_from : [TypePokemonResults]?
    var double_damage_to : [TypePokemonResults]?
    var half_damage_from : [TypePokemonResults]?
    var half_damage_to : [TypePokemonResults]?
    var no_damage_from : [TypePokemonResults]?
    var no_damage_to : [TypePokemonResults]?
}
