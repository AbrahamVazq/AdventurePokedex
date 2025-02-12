//  PokeTypesPresenter.swift
//  AdventurePokedex
//
//  Created by Abraham Vazquez on 12/02/25.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class PokeTypesPresenter: PokeTypes_ViewToPresenterProtocol {
    
    weak var view: PokeTypes_PresenterToViewProtocol?
    var interactor: PokeTypes_PresenterToInteractorProtocol?
    var router: PokeTypes_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension PokeTypesPresenter: PokeTypes_InteractorToPresenterProtocol {

}
