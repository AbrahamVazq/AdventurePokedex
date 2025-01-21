//  DetailPokemonPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class DetailPokemonPresenter: DetailPokemon_ViewToPresenterProtocol {
    
    weak var view: DetailPokemon_PresenterToViewProtocol?
    var interactor: DetailPokemon_PresenterToInteractorProtocol?
    var router: DetailPokemon_PresenterToRouterProtocol?
    
    func getToSprites(with id: String) {
        interactor?.getToSpritesToInteractor(with: id)
    }
    
    func getToChainEvol(with id: String) {
        interactor?.getToChainEvolToInteracto(with: id)
    }
    
    private func returnChainEvolution(withChain chain: ChainEvolutionResponse) -> DetailPokemonChain {
        
        if chain.chain?.evolves_to?.count == 0 { return DetailPokemonChain() }
    
        let arrNames: [String] = setEvolutionNames(withChain: chain)
        //TODO: Mandar los demas datos detalle para la evolucion
        //var arrComplementarios: [] = [DetailPokemonChain]
        var objEvolution: DetailPokemonChain = DetailPokemonChain()
        objEvolution.name = arrNames
        return objEvolution
    }
    
    func setEvolutionNames(withChain chain: ChainEvolutionResponse) -> [String] {
        var arrNames: [String] = [String]()
        arrNames.insert(chain.chain?.species?.name ?? "", at: 0)
        arrNames.insert(chain.chain?.evolves_to?.first?.species?.name ?? "", at: 1)
        arrNames.insert(chain.chain?.evolves_to?.first?.evolves_to?.first?.species?.name ?? "", at: 2)
        return arrNames
    }
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension DetailPokemonPresenter: DetailPokemon_InteractorToPresenterProtocol {
    func getPokemonInfoFromInteractor(onPokemon pokemonInfo: SpritesPokemonResponse) {
        view?.updateInfo(onPokemon: pokemonInfo)
    }

    func getChainEvolInfoFromInteractor(withChain chain: ChainEvolutionResponse) {
        view?.updateInfo(withChain: self.returnChainEvolution(withChain: chain))
    }
    
    func getErrorFromInteractor(withError error: NSError) {
        view?.updateErrorService(withError: error)
    }
}
