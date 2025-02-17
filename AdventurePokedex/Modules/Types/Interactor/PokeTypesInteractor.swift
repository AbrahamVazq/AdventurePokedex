//  PokeTypesInteractor.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class PokeTypesInteractor: PokeTypes_PresenterToInteractorProtocol {
    weak var presenter: PokeTypes_InteractorToPresenterProtocol?
    private var strMethod: String = "https"
    private var strHost: String = "pokeapi.co"
    
    func goToTypeToInteractor() {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: PokeURLConfiguration(strMethod: strMethod, strHost: strHost, path: Paths.getAllTypes.getPath()))
        service.launchService { [weak self] (result: Result<TypesPokemonResponse, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.getToTypesFromInteractor(with: success)
            case .failure(let error):
                self?.presenter?.getErrorFromInteractor(withError: error as NSError)
            }
        }
    }
}
