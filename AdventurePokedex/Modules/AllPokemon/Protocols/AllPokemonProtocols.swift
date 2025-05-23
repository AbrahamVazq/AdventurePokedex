//  AllPokemonProtocols.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Si queremos ir a otro modulo VIPER
 
    * goTo___________( )
    * goTo___________( _ : )
 
 Si queremos ir por datos o hacer un consumo
    * viewDidLoad()
    * getTo___________( )
    * getTo___________( _ : )
 */

// MARK: VIEW -> PRESENTER
protocol AllPokemon_ViewToPresenterProtocol: AnyObject {
	var view: AllPokemon_PresenterToViewProtocol? { get set }
	var interactor: AllPokemon_PresenterToInteractorProtocol? { get set }
	var router: AllPokemon_PresenterToRouterProtocol? { get set }
    func viewDidLoad()
    func getToSpecie(with id:String)
    func didSelect(atIndex index: Int, andIdSpecie specie: String)
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/**
 Sugerencias en el llamado de Funciones de  Presenter a Interactor
 :condiciones:
 
 Tratemos que la funcion se llame igual que desde la que viene en la vista al Presenter,
 pero en esta ocacion agregemosle el subfijo: 'ToInteractor', para saber que vamos
 del presenter al iintectartor
 
    * get___________ToInteractor( )
    * getTo___________ToInteractor( )
 
    * get___________ToInteractor( _ : )
    * getTo___________ToInteractor( _ : )
 
 */

// MARK: PRESENTER -> INTERACTOR
protocol AllPokemon_PresenterToInteractorProtocol: AnyObject {
    var presenter: AllPokemon_InteractorToPresenterProtocol? { get set }
    func getAllPokemon()
    func getToSpecieToInteractor(with id:String)
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Tratemos que la funcion se llame igual que desde la que viene en la vista al Presenter,
 pero en esta ocacion agregemosle el subfijo: 'FromInteractor' con los parametros que correspondan,
 para saber que vamos del Interactor  al Presenter
 
    * get___________FromInteractor( )
    * getTo___________FromInteractor( )
 
    * get___________FromInteractor(_ :)
    * getTo___________FromInteractor(_ :)
 */

// MARK: INTERACTOR -> PRESENTER
protocol AllPokemon_InteractorToPresenterProtocol: AnyObject {
    func getAllPokemonFromInteractor(withPokemon pokemon: AllPokemonResponse)
    func getSpecieInfoFromInteractor(withSpecie specie: SpeciesPokemonResponse)
    func errorFromInteractor(with error: Error)
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Tratemos de usar la funcion updateView(_ :), con los parametros que correspondan, para
 saber que vamos del Presenter a la Vista.
 
    * updateView(_: )
 
 */

// MARK: PRESENTER -> VIEW
protocol AllPokemon_PresenterToViewProtocol: AnyObject {
    var presenter: AllPokemon_ViewToPresenterProtocol? { get set }
    func updateView(from pokemon: AllPokemonResponse)
    func updateInfo(withSpecie specie: SpeciesPokemonResponse)
    func update(with error: Error)
}

//MARK: - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
/**
 Sugerencias en el llamado de Funciones de Vista a Presenter
 :condiciones:
 
 Si queremos ir a otro modulo VIPER, usemos goTo_________( _ : ), con parametros si es necesario para
 asegurar que vamos del Presenter a el Router de otro Modulo VIPER.
 
    * goTo___________( _ : )
 */

// MARK: PRESENTER -> ROUTER
protocol AllPokemon_PresenterToRouterProtocol: AnyObject {
    func goToDetailPokemon(atIndex index: Int, idSpecie: String, andView view: AllPokemon_PresenterToViewProtocol)
}


protocol PathsProtocol {
    var strPathToUse: String { get }
}
