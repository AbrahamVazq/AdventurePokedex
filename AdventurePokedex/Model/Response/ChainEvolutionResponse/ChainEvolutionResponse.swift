//  ChainEvolutionResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import Foundation

struct ChainEvolutionResponse : Codable {
    var baby_trigger_item : String?
    var chain : ChainEvol?
    var id : Int?
}


struct ChainEvol : Codable {
    var evolution_details : [String]?
    var evolves_to : [Evolves_to]?
    var is_baby : Bool?
    var species : SpeciesAndTriggerEvol?
}

struct Evolves_to : Codable {
    var evolution_details : [Evolution_details]?
    var evolves_to : [Evolves_to]?
    var is_baby : Bool?
    var species : SpeciesAndTriggerEvol?
}

struct SpeciesAndTriggerEvol : Codable {
    var name : String?
    var url : String?
}

struct Evolution_details : Codable {
    var gender : String?
    var held_item : String?
    var item : String?
    var known_move : String?
    var known_move_type : String?
    var location : String?
    var min_affection : String?
    var min_beauty : String?
    var min_happiness : String?
    var min_level : Int?
    var needs_overworld_rain : Bool?
    var party_species : String?
    var party_type : String?
    var relative_physical_stats : String?
    var time_of_day : String?
    var trade_species : String?
    var trigger : SpeciesAndTriggerEvol?
    var turn_upside_down : Bool?
}
