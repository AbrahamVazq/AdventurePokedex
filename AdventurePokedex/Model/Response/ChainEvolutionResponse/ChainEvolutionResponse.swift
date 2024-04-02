//  ChainEvolutionResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import Foundation

struct Json4Swift_Base : Codable {
    var baby_trigger_item : String?
    var chain : ChainResponse?
    var id : Int?
}

struct ChainResponse : Codable {
    var evolution_details : [String]?
    var evolves_to : [Evolves_to]?
    var is_baby : Bool?
//    var species : Species? 
}


struct Evolves_to : Codable {
    var evolution_details : [Evolution_details]?
    var evolves_to : [String]?
    var is_baby : Bool?
}

struct Evolution_details : Codable {
    let gender : String?
    let held_item : String?
    let item : Item?
    let known_move : String?
    let known_move_type : String?
    let location : String?
    let min_affection : String?
    let min_beauty : String?
    let min_happiness : String?
    let min_level : String?
    let needs_overworld_rain : Bool?
    let party_species : String?
    let party_type : String?
    let relative_physical_stats : String?
    let time_of_day : String?
    let trade_species : String?
    let turn_upside_down : Bool?
}

struct Item : Codable {
    let name : String?
    let url : String?
}
