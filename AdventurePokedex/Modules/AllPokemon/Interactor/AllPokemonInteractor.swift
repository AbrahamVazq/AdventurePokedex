//  AllPokemonInteractor.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class AllPokemonInteractor: AllPokemon_PresenterToInteractorProtocol {
    weak var presenter: AllPokemon_InteractorToPresenterProtocol?
    private var strMethod: String = "https"
    private var strHost: String = "pokeapi.co"
    
    func getAllPokemon(){
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration:
                                                                PokeURLConfiguration(strMethod: strMethod, strHost: strHost, path: Paths.getAllPokemon.getPath()))
        
        service.launchService {[weak self] (result: Result<AllPokemonResponse, ErrorNetwork> ) in
            switch result {
            case .success(let success):
                self?.presenter?.getAllPokemonFromInteractor(withPokemon: success)
            case .failure(let error):
                self?.presenter?.errorFromInteractor(with: error)
            }
        }
    }
    
    func getToSpecieToInteractor(with id: String) {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: PokeURLConfiguration(strMethod: strMethod,
                                                                                                     strHost: strHost,
                                                                                                     path: Paths.getSpecie(fomId: id).getPath()))
        service.launchService { [weak self] (result: Result<SpeciesPokemonResponse, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.getSpecieInfoFromInteractor(withSpecie: success)
            case .failure(let error):
                self?.presenter?.errorFromInteractor(with: error)
            }
        }
    }
}
