//  AllRegionRouter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.
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
    func goToChooseRegion(withId idRegion: Int, orPokeRegion region: PokeGeneral, andview view: AllRegion_PresenterToViewProtocol) {
        if let view = view as? AllRegionViewController {
            if idRegion != 9 {
                let vc = ChoosePokedexViewController()
                vc.idToShowRegion = idRegion
                vc.modalPresentationStyle = .automatic
                view.navigationController?.present(vc, animated: true)
            } else {
                let vc = PokeRegionRouter.createModule(withRegion: region)
                view.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
