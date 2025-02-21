//  ChoosePokedexPresenter.swift
//  AdventurePokedex
//
//  Created by Abraham Vazquez on 21/02/25.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class ChoosePokedexPresenter: ChoosePokedex_ViewToPresenterProtocol {
    
    weak var view: ChoosePokedex_PresenterToViewProtocol?
    var interactor: ChoosePokedex_PresenterToInteractorProtocol?
    var router: ChoosePokedex_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension ChoosePokedexPresenter: ChoosePokedex_InteractorToPresenterProtocol {

}
