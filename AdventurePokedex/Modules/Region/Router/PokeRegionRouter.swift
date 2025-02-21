//  PokeRegionRouter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class PokeRegionRouter {
	
    static func createModule(withRegion region: PokeGeneral) -> UIViewController {
        
        let view = PokeRegionViewController()
        let presenter = PokeRegionPresenter()
        let interactor = PokeRegionInteractor()
        let router = PokeRegionRouter()
        
        view.presenter = presenter
        view.region = region
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension PokeRegionRouter: PokeRegion_PresenterToRouterProtocol {
    
}
