//  AllRegionRouter.swift
//  AdventurePokedex
//
//  Created by Abraham Vazquez on 14/02/25.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class AllRegionRouter {
	
    static func createModule() -> UIViewController {
        
        let view = AllRegionViewController()
        let presenter = AllRegionPresenter()
        let interactor = AllRegionInteractor()
        let router = AllRegionRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension AllRegionRouter: AllRegion_PresenterToRouterProtocol {
    
}
