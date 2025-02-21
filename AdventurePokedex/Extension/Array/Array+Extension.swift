//  Array+Extension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 04/02/24.

import Foundation

extension Array {
    func returnSprites(fromSprites sprites: SpritesResponse ) -> [String] {
        var aux: [String] = []
        aux.append(sprites.front_default ?? "")
        aux.append(sprites.back_default ?? "")
        aux.append(sprites.front_shiny ?? "")
        aux.append(sprites.back_shiny ?? "")
        return aux
    }
    
    subscript (safe index: Index) -> Element? {
        .zero <= index && index < count ? self[index] : nil
    }
    
    func returnArraysRegion(fromId id: String) -> [PokeGeneral] {
        switch id {
        case "1":
            return [PokeGeneral(name: "kanto", url: "https://pokeapi.co/api/v2/pokedex/2/"),
                    PokeGeneral(name: "letsgo-kanto", url: "https://pokeapi.co/api/v2/pokedex/26/")]
        case "2":
            return [PokeGeneral(name: "original-johto", url: "https://pokeapi.co/api/v2/pokedex/3/"),
                    PokeGeneral(name: "updated-johto", url: "https://pokeapi.co/api/v2/pokedex/7/")]
        case "3":
            return [PokeGeneral(name: "hoenn", url: "https://pokeapi.co/api/v2/pokedex/4/"),
                    PokeGeneral(name: "updated-hoenn", url: "https://pokeapi.co/api/v2/pokedex/15/")]
        case "4":
            return [PokeGeneral(name: "original-sinnoh", url: "https://pokeapi.co/api/v2/pokedex/5/"),
                    PokeGeneral(name: "extended-sinnoh", url: "https://pokeapi.co/api/v2/pokedex/6/")]
        case "5":
            return [PokeGeneral(name: "original-unova", url: "https://pokeapi.co/api/v2/pokedex/8/"),
                    PokeGeneral(name: "updated-unova", url: "https://pokeapi.co/api/v2/pokedex/9/")]
        case "6":
            return [PokeGeneral(name: "kalos-central", url: "https://pokeapi.co/api/v2/pokedex/12/"),
                    PokeGeneral(name: "kalos-coastal", url: "https://pokeapi.co/api/v2/pokedex/13/"),
                    PokeGeneral(name: "kalos-mountain", url: "https://pokeapi.co/api/v2/pokedex/14/")]
        case "7":
            return [PokeGeneral(name: "original-alola", url: "https://pokeapi.co/api/v2/pokedex/16/"),
                    PokeGeneral(name: "original-melemele", url: "https://pokeapi.co/api/v2/pokedex/17/"),
                    PokeGeneral(name: "original-akala", url: "https://pokeapi.co/api/v2/pokedex/18/"),
                    PokeGeneral(name: "original-ulaula", url: "https://pokeapi.co/api/v2/pokedex/19/"),
                    PokeGeneral(name: "original-poni", url: "https://pokeapi.co/api/v2/pokedex/20/"),
                    PokeGeneral(name: "updated-alola", url: "https://pokeapi.co/api/v2/pokedex/21/"),
                    PokeGeneral(name: "updated-melemele", url: "https://pokeapi.co/api/v2/pokedex/22/"),
                    PokeGeneral(name: "updated-akala", url: "https://pokeapi.co/api/v2/pokedex/23/"),
                    PokeGeneral(name: "updated-ulaula", url: "https://pokeapi.co/api/v2/pokedex/24/"),
                    PokeGeneral(name: "updated-poni", url: "https://pokeapi.co/api/v2/pokedex/25/")]
        case "8":
            return [PokeGeneral(name: "galar", url: "https://pokeapi.co/api/v2/pokedex/27/"),
                    PokeGeneral(name: "isle-of-armor", url: "https://pokeapi.co/api/v2/pokedex/28/"),
                    PokeGeneral(name: "crown-tundra", url: "https://pokeapi.co/api/v2/pokedex/29/")]
        case "10":
            return [PokeGeneral(name: "original-unova", url: "https://pokeapi.co/api/v2/pokedex/8/"),
                    PokeGeneral(name: "updated-unova", url: "https://pokeapi.co/api/v2/pokedex/9/")]
        default:
            return []
        }
    }
}
