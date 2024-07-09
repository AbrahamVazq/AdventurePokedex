//  ChainEvolutionResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import Foundation

struct ChainEvolutionResponse : Codable {
    let baby_trigger_item : String?
    let chain : ChainEvol?
    let id : Int?
}


struct ChainEvol : Codable {
    let evolution_details : [String]?
    let evolves_to : [Evolves_to]?
    let is_baby : Bool?
    let species : SpeciesAndTriggerEvol?
}

struct Evolves_to : Codable {
    let evolution_details : [Evolution_details]?
    let evolves_to : [Evolves_to]?
    let is_baby : Bool?
    let species : SpeciesAndTriggerEvol?
}

struct SpeciesAndTriggerEvol : Codable {
    let name : String?
    let url : String?
}

struct Evolution_details : Codable {
    let gender : String?
    let held_item : String?
    let item : String?
    let known_move : String?
    let known_move_type : String?
    let location : String?
    let min_affection : String?
    let min_beauty : String?
    let min_happiness : String?
    let min_level : Int?
    let needs_overworld_rain : Bool?
    let party_species : String?
    let party_type : String?
    let relative_physical_stats : String?
    let time_of_day : String?
    let trade_species : String?
    let trigger : SpeciesAndTriggerEvol?
    let turn_upside_down : Bool?
}
