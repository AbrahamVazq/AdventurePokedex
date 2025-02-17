//  AllRegionPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class AllRegionPresenter: AllRegion_ViewToPresenterProtocol {
    weak var view: AllRegion_PresenterToViewProtocol?
    var interactor: AllRegion_PresenterToInteractorProtocol?
    var router: AllRegion_PresenterToRouterProtocol?
    
    func goToTypes() {
        self.interactor?.goToTypesToInteractor()
    }
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension AllRegionPresenter: AllRegion_InteractorToPresenterProtocol {
    
    func getToAllRegionFromInteractor(withRegions regions: AllRegionResponse) {
        self.view?.updateView(WithRegions: regions)
    }
    
    func getErrorFromInteractor(withError error: NSError) {
        self.view?.updateErrorService(withError: error)
    }
}
