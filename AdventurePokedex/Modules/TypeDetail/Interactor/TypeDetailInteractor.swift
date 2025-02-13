//  TypeDetailInteractor.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class TypeDetailInteractor: TypeDetail_PresenterToInteractorProtocol {
    weak var presenter: TypeDetail_InteractorToPresenterProtocol?
    private var strMethod: String = "https"
    private var strHost: String = "pokeapi.co"
    
    func goToTypeDetailToInteractor(with idType: String) {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: PokeURLConfiguration(strMethod: strMethod, strHost: strHost, path: Paths.getTypeDetial(fromId: idType).getPath()))
        service.launchService { [weak self] (result: Result<TypesDetailResponse, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.getToTypeDetailFromInteractor(withDetail: success)
            case .failure(let error):
                self?.presenter?.getErrorFromInteractor(withError: error as NSError)
            }
        }
    }
}

