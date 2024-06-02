//  String+Extension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import Foundation

extension String: PathsProtocol {
    var strPathToUse: String { return self }
}

extension String {
    
    func returnIDToSpecieChain() -> String {
        var aux = ""
        var arrAux: [String] = []
        arrAux.append(contentsOf: self.components(separatedBy: "chain" ))
        aux = arrAux.count == 2 ? arrAux[1] : "noTengoNada"
        aux = aux.replacingOccurrences(of: "/", with: "")
        return aux
    }
    
    func translate() -> String {
        switch self {
        case "fire":
            return "Fuego"
        case "electric":
            return "Electrico"
        case "grass":
            return "Planta"
        case "poison":
            return "Veneno"
        case "water":
            return "Agua"
        case "bug":
            return "Bicho"
        case "flying":
            return "Volador"
        case "normal":
            return "Normal"
        case "ground":
            return "Tierra"
        case "rock":
            return "Roca"
        case "fairy":
            return "Hada"
        case "fighting":
            return "Lucha"
        case "psychic":
            return "Psiquico"
        case "steel":
            return "Acero"
        case "ice":
            return "Hielo"
        case "ghost":
            return "Fantasma"
        case "dragon":
            return "Dragon"
        case "dark":
            return "Siniestro"
        default:
            return "Unknow"
        }
    }
    
}
