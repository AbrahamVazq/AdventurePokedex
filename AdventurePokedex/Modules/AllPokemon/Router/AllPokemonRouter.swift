//  AllPokemonRouter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class AllPokemonRouter {
	
    static func createModule() -> UIViewController {
        
        let view = AllPokemonViewController()
        let presenter = AllPokemonPresenter()
        let interactor = AllPokemonInteractor()
        let router = AllPokemonRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension AllPokemonRouter: AllPokemon_PresenterToRouterProtocol {
    func goToDetailPokemon(atIndex index: Int, andView view: AllPokemon_PresenterToViewProtocol) {
        if let view = view as? AllPokemonViewController {
            let vc = DetailPokemonRouter.createModule(with: "\(index)")
            view.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
