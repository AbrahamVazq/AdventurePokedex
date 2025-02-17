//  AllRegionInteractor.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class AllRegionInteractor: AllRegion_PresenterToInteractorProtocol {
    weak var presenter: AllRegion_InteractorToPresenterProtocol?
    private var strMethod: String = "https"
    private var strHost: String = "pokeapi.co"
    
    func goToTypesToInteractor() {
        let service: NetworkAPIProtocol = PokeServicesManager(urlConfiguration: PokeURLConfiguration(strMethod: strMethod, strHost: strHost, path: Paths.getAllRegions.getPath()))
        service.launchService { [weak self] (result: Result<AllRegionResponse, ErrorNetwork>) in
            switch result {
            case .success(let success):
                self?.presenter?.getToAllRegionFromInteractor(withRegions: success)
            case .failure(let error):
                self?.presenter?.getErrorFromInteractor(withError: error as NSError)
            }
        }
    }
}
