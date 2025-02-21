//  PokeTypesProtocols.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation


// MARK: VIEW -> PRESENTER
protocol PokeTypes_ViewToPresenterProtocol: AnyObject {
	var view: PokeTypes_PresenterToViewProtocol? { get set }
	var interactor: PokeTypes_PresenterToInteractorProtocol? { get set }
	var router: PokeTypes_PresenterToRouterProtocol? { get set }
    func goToTypes()
    func didSelect(withType type: PokeGeneral)
}


// MARK: PRESENTER -> INTERACTOR
protocol PokeTypes_PresenterToInteractorProtocol: AnyObject {
    var presenter: PokeTypes_InteractorToPresenterProtocol? { get set }
    func goToTypeToInteractor()
}


// MARK: INTERACTOR -> PRESENTER
protocol PokeTypes_InteractorToPresenterProtocol: AnyObject {
    func getToTypesFromInteractor(with pokemonTypes: TypesPokemonResponse)
    func getErrorFromInteractor(withError error: NSError)
}


// MARK: PRESENTER -> VIEW
protocol PokeTypes_PresenterToViewProtocol: AnyObject {
    var presenter: PokeTypes_ViewToPresenterProtocol? { get set }
    func updateInfo(with pokemonTypes: TypesPokemonResponse)
    func updateErrorService(withError error: NSError)
}


// MARK: PRESENTER -> ROUTER
protocol PokeTypes_PresenterToRouterProtocol: AnyObject {
    func goToDetail(withType type: PokeGeneral, andView view: PokeTypes_PresenterToViewProtocol)
}
