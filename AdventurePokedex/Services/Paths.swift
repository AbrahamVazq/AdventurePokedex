//  Paths.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import Foundation

enum Paths {
    case getAllPokemon
    //    case path2(param1: <#Type#>)
    //    case path3(param1: <#Type#>, param2: <#Type#>)
    
    func getPath() -> String {
        switch self {
        case .getAllPokemon:
            return "/api/v2/pokedex/1/"
            //    case .path2(param1: let variableName):
            //        return "path/param=(variableName)"
            //
            //    case .path3(param1: let variableUno, param2: let variableDos):
            //        return "path/param=\(variableUno),param2=\(variableDos)"
            
        }
    }

}
