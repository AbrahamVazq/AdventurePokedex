//  PokeRegionPresenter.swift
//  AdventurePokedexTr
//  Created by Abraham Vazquez on 18/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class PokeRegionPresenter: PokeRegion_ViewToPresenterProtocol {
    weak var view: PokeRegion_PresenterToViewProtocol?
    var interactor: PokeRegion_PresenterToInteractorProtocol?
    var router: PokeRegion_PresenterToRouterProtocol?
    
    func goToRegion(withId id: String) {
        self.interactor?.getToRegonToInteractor(withId: id)
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension PokeRegionPresenter: PokeRegion_InteractorToPresenterProtocol {
    func getToRegionDetailFromInteractor(withRegion region: RegionDetailResponse) {
        self.view?.udopateView(withRegion: region)
    }
    
    func getErrorFromInteractor(withError error: NSError) {
        self.view?.updateErrorService(withError: error)
    }
}
