//  TypesDetailResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.

import Foundation

struct Json4Swift_Base : Codable {
    let id : Int?
    let name : String?
    let damage_relations : Damage_relations?
}

struct Damage_relations : Codable {
    let double_damage_from : [String]?
    let double_damage_to : [String]?
    let half_damage_from : [String]?
    let half_damage_to : [String]?
    let no_damage_from : [String]?
    let no_damage_to : [String]?
}
