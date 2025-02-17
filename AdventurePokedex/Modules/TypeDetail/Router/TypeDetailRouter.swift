//  TypeDetailRouter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class TypeDetailRouter {
	
    static func createModule(withIdType type: PokeGeneral) -> UIViewController {
        
        let view = TypeDetailViewController()
        let presenter = TypeDetailPresenter()
        let interactor = TypeDetailInteractor()
        let router = TypeDetailRouter()
        
        view.presenter = presenter
        view.type = type
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension TypeDetailRouter: TypeDetail_PresenterToRouterProtocol {
    
}
