//  ChainEvolutionResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import Foundation

struct ChainEvolutionResponse : Codable {
    var baby_trigger_item : ChainDataComplement?
    var chain : ChainEvol?
    var id : Int?
}


struct ChainEvol : Codable {
    var evolution_details : [String]?
    var evolves_to : [Evolves_to]?
    var is_baby : Bool?
    var species : ChainDataComplement?
}

struct Evolves_to : Codable {
    var evolution_details : [Evolution_details]?
    var evolves_to : [Evolves_to]?
    var is_baby : Bool?
    var species : ChainDataComplement?
}

struct ChainDataComplement : Codable {
    var name : String?
    var url : String?
}

struct Evolution_details : Codable {
    var gender : Int?
    var held_item : ChainDataComplement?
    var item : ChainDataComplement?
    var known_move : ChainDataComplement?
    var known_move_type : ChainDataComplement?
    var location : ChainDataComplement?
    var min_affection : Int?
    var min_beauty : Int?
    var min_happiness : Int?
    var min_level : Int?
    var needs_overworld_rain : Bool?
    var party_species : ChainDataComplement?
    var party_type : ChainDataComplement?
    var relative_physical_stats : Int?
    var time_of_day : String?
    var trade_species : ChainDataComplement?
    var trigger : ChainDataComplement?
    var turn_upside_down : Bool?
}
