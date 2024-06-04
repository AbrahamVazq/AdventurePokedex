//  AllPokemonPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23. 
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class AllPokemonPresenter: AllPokemon_ViewToPresenterProtocol {
    weak var view: AllPokemon_PresenterToViewProtocol?
    var interactor: AllPokemon_PresenterToInteractorProtocol?
    var router: AllPokemon_PresenterToRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getAllPokemon()
    }
    
    func getToSpecie(with id: String) {
        interactor?.getToSpecieToInteractor(with: id)
    }
    
    func didSelect(atIndex index: Int) {
        if let view = view {
            router?.goToDetailPokemon(atIndex: index, andView: view)
        }
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension AllPokemonPresenter: AllPokemon_InteractorToPresenterProtocol {
    
    func getAllPokemonFromInteractor(withPokemon pokemon: AllPokemonResponse) {
        view?.updateView(from: pokemon)
    }
    
    func getSpecieInfoFromInteractor(withSpecie specie: SpeciesPokemonResponse) {
        view?.updateInfo(withSpecie: specie)
    }
    
    func errorFromInteractor(with error: Error) {
        view?.update(with: error)
    }
    
}
