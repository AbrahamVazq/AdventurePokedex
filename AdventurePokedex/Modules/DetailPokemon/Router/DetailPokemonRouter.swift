//  DetailPokemonRouter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class DetailPokemonRouter {
	
    static func createModule() -> UIViewController {
        
        let view = DetailPokemonViewController()
        let presenter = DetailPokemonPresenter()
        let interactor = DetailPokemonInteractor()
        let router = DetailPokemonRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension DetailPokemonRouter: DetailPokemon_PresenterToRouterProtocol {
    
}
