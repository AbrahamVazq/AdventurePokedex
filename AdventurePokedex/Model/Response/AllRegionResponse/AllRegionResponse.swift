//  AllRegionResponse.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.


struct AllRegionResponse : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [PokeGeneral]?
}
