//  DetailPokemonPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class DetailPokemonPresenter: DetailPokemon_ViewToPresenterProtocol {
    
    weak var view: DetailPokemon_PresenterToViewProtocol?
    var interactor: DetailPokemon_PresenterToInteractorProtocol?
    var router: DetailPokemon_PresenterToRouterProtocol?
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension DetailPokemonPresenter: DetailPokemon_InteractorToPresenterProtocol {

}
