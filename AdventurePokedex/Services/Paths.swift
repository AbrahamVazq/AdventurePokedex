//  Paths.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import Foundation

enum Paths {
    case getAllPokemon
    case getSprites(fromId:String)
    case getSpecie(fomId:String)
    case getChainEvolution(fromId:String)
    case getAllTypes
    case getTypeDetial(fromId:String)
    case getAllRegions
    case getRegionDetail(fromId:String)
    //    case path3(param1: <#Type#>, param2: <#Type#>)
    
    func getPath() -> String {
        switch self {
        case .getAllPokemon:
            return "/api/v2/pokedex/1/"
            
        case .getSprites(fromId: let id):
            return "/api/v2/pokemon/\(id)/"
            
        case .getSpecie(fomId: let id):
            return "/api/v2/pokemon-species/\(id)/"
            
        case .getChainEvolution(fromId: let id):
            return "/api/v2/evolution-chain/\(id)/"

        case .getAllTypes:
            return "/api/v2/type/"
            
        case .getTypeDetial(fromId: let id):
            return "/api/v2/type/\(id)/"
            
        case .getAllRegions:
            return "/api/v2/region/"
            
        case .getRegionDetail(fromId: let id):
            return "/api/v2/pokedex/\(id)/"
            
  //    case .path3(param1: let variableUno, param2: let variableDos):
  //        return "path/param=\(variableUno),param2=\(variableDos)"
            
        }
    }
}

