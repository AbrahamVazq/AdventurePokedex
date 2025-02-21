//  PokeRegionInteractor.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class PokeRegionInteractor: PokeRegion_PresenterToInteractorProtocol {
    weak var presenter: PokeRegion_InteractorToPresenterProtocol?
    private var strMethod: String = "https"
    private var strHost: String = "pokeapi.co"
    
    func getToRegonToInteractor(withId id: String) {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: PokeURLConfiguration(strMethod: strMethod, strHost: strHost, path: Paths.getRegionDetail(fromId: id).getPath()))
        service.launchService { [weak self] (result: Result<RegionDetailResponse, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.getToRegionDetailFromInteractor(withRegion: success)
            case .failure(let error):
                self?.presenter?.getErrorFromInteractor(withError: error as NSError)
            }
        }
    }
}
