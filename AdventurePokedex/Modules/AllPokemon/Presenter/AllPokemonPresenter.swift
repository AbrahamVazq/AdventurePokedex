//  AllPokemonPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23. 
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class AllPokemonPresenter: AllPokemon_ViewToPresenterProtocol {
    
    weak var view: AllPokemon_PresenterToViewProtocol?
    var interactor: AllPokemon_PresenterToInteractorProtocol?
    var router: AllPokemon_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension AllPokemonPresenter: AllPokemon_InteractorToPresenterProtocol {

}
