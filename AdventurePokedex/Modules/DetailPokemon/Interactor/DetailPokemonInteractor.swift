//  DetailPokemonInteractor.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class DetailPokemonInteractor: DetailPokemon_PresenterToInteractorProtocol {
    weak var presenter: DetailPokemon_InteractorToPresenterProtocol?
    private var strMethod: String = "https"
    private var strHost: String = "pokeapi.co"
    
    func getToSpritesToInteractor(with id: String) {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration:
                                                                PokeURLConfiguration(strMethod: strMethod, strHost: strHost, path: Paths.getSprites(fromId: id).getPath() ))
        service.launchService {[weak self] (result: Result<SpritesPokemonResponse, ErrorNetwork> ) in
            switch result {
            case .success(let success):
                self?.presenter?.getPokemonInfoFromInteractor(onPokemon: success)
            case .failure(let error):
                self?.presenter?.getErrorFromInteractor(withError: error as NSError)
            }
        }
    }
    
    func getToChainEvolToInteracto(with id: String) {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: PokeURLConfiguration(strMethod: strMethod,
                                                                                                     strHost: strHost,
                                                                                                     path: Paths.getChainEvolution(fromId: id).getPath()))
        print("\n\n\n service --->>> \(service.urlConfiguration.path.strPathToUse) \n\n\n")
        service.launchService { [weak self] (result: Result<ChainEvolutionResponse, ErrorNetwork>) in
            switch result {
            case .success(let success):
                print("\n\n\n success --->>> \(success) \n\n\n")
                //                self?.presenter?.getSpecieInfoFromInteractor(withSpecie: success)
            case .failure(let error):
                self?.presenter?.getErrorFromInteractor(withError: error as NSError)
            }
        }
    }
}
