//  DetailPokemonProtocols.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

// MARK: VIEW -> PRESENTER
protocol DetailPokemon_ViewToPresenterProtocol: AnyObject {
	var view: DetailPokemon_PresenterToViewProtocol? { get set }
	var interactor: DetailPokemon_PresenterToInteractorProtocol? { get set }
	var router: DetailPokemon_PresenterToRouterProtocol? { get set }
    func getToSprites(with id:String)
    func getToChainEvol(with id:String)
}


// MARK: PRESENTER -> INTERACTOR
protocol DetailPokemon_PresenterToInteractorProtocol: AnyObject {
    var presenter: DetailPokemon_InteractorToPresenterProtocol? { get set }
    func getToSpritesToInteractor(with id:String)
    func getToChainEvolToInteracto(with id:String)
}


// MARK: INTERACTOR -> PRESENTER
protocol DetailPokemon_InteractorToPresenterProtocol: AnyObject {
    func getPokemonInfoFromInteractor(onPokemon pokemonInfo: SpritesPokemonResponse)
    func getChainEvolInfoFromInteractor(withChain chain: ChainEvolutionResponse)
    func getErrorFromInteractor(withError error: NSError)
}


// MARK: PRESENTER -> VIEW
protocol DetailPokemon_PresenterToViewProtocol: AnyObject {
    var presenter: DetailPokemon_ViewToPresenterProtocol? { get set }
    func updateInfo(onPokemon pokemonInfo: SpritesPokemonResponse)
    func updateInfo(withChain chain: DetailPokemonChain, trigger: String, andDetail: [String])
    func updateErrorService(withError error: NSError)
}


// MARK: PRESENTER -> ROUTER
protocol DetailPokemon_PresenterToRouterProtocol: AnyObject {
}
