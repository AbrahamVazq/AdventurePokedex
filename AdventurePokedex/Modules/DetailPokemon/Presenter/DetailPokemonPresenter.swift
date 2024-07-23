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
    
    private func returnChainEvolution(withChain chain: ChainEvolutionResponse) {
        
//        print("\n\n\n <#some#> --->>> \(<#some#>) \n\n\n")
        print("\n\n Chain.chain.evolvesTo.count --->>> \(chain.chain?.evolves_to?.count ?? 0) \n")
        print("\n\n Chain.chain.evolvesTo.first--->>> \(chain.chain?.evolves_to?.first ?? Evolves_to()) \n")
        print("\n\n Chain.chain.evolvesTo.first.evolves_to.count --->>> \(chain.chain?.evolves_to?.first?.evolves_to?.count ?? 0) \n")
        print("\n\n Chain.chain.evolvesTo.first.evolves_to.first --->>> \(chain.chain?.evolves_to?.first?.evolves_to?.first ?? Evolves_to()) \n")
        
        let firstStep: SpeciesAndTriggerEvol = chain.chain?.species ?? SpeciesAndTriggerEvol()
        let secondStep: SpeciesAndTriggerEvol = chain.chain?.evolves_to?.first?.species ?? SpeciesAndTriggerEvol()
        let thirdStep: SpeciesAndTriggerEvol = chain.chain?.evolves_to?.first?.evolves_to?.first?.species ?? SpeciesAndTriggerEvol()
        
        print("\n Primera Evolucion --->>> \(firstStep.name) \n")
        print("\n Primera Evolucion --->>> \(secondStep.name) \n")
        print("\n Primera Evolucion --->>> \(thirdStep.name) \n")
        
        
        
    }
    
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension DetailPokemonPresenter: DetailPokemon_InteractorToPresenterProtocol {
    func getPokemonInfoFromInteractor(onPokemon pokemonInfo: SpritesPokemonResponse) {
        view?.updateInfo(onPokemon: pokemonInfo)
    }

    func getChainEvolInfoFromInteractor(withChain chain: ChainEvolutionResponse) {
        self.returnChainEvolution(withChain: chain)
//        view?.updateInfo(withChain: chain)
    }
    
    func getErrorFromInteractor(withError error: NSError) {
        view?.updateErrorService(withError: error)
    }
}
