//  PokeTypesRouter.swift
//  AdventurePokedex
//
//  Created by Abraham Vazquez on 12/02/25.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class PokeTypesRouter {
	
    static func createModule() -> UIViewController {
        
        let view = PokeTypesViewController()
        let presenter = PokeTypesPresenter()
        let interactor = PokeTypesInteractor()
        let router = PokeTypesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension PokeTypesRouter: PokeTypes_PresenterToRouterProtocol {
    
}
