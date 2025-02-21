//  ChoosePokedexRouter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 21/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class ChoosePokedexRouter {
	
    static func createModule(withIdRegion id: Int) -> UIViewController {
        
        let view = ChoosePokedexViewController()
        let presenter = ChoosePokedexPresenter()
        let interactor = ChoosePokedexInteractor()
        let router = ChoosePokedexRouter()
        
        view.presenter = presenter
        view.idToShowRegion = id
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension ChoosePokedexRouter: ChoosePokedex_PresenterToRouterProtocol {
    //    func goToRegion(withRegion  region: PokeGeneral, andView view: AllRegion_PresenterToViewProtocol) {
    //        if let view = view as? AllRegionViewController {
    //            let vc = PokeRegionRouter.createModule(withRegion: region)
    //            view.navigationController?.pushViewController(vc, animated: true)
    //        }
    //    }
}
