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
    var double_damage_from : [PokeGeneral]?
    var double_damage_to : [PokeGeneral]?
    var half_damage_from : [PokeGeneral]?
    var half_damage_to : [PokeGeneral]?
    var no_damage_from : [PokeGeneral]?
    var no_damage_to : [PokeGeneral]?
}
