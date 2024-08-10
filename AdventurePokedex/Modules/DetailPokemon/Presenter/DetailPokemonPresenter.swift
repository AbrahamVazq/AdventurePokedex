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
    
    private func returnChainEvolution(withChain chain: ChainEvolutionResponse) -> [DetailPokemonChain] {

        print("\n\n Chain.chain.evolvesTo.count --->>> \(chain.chain?.evolves_to?.count ?? 0) \n")
        print("\n\n Chain.chain.evolvesTo.first--->>> \(chain.chain?.evolves_to?.first ?? Evolves_to()) \n")
        print("\n\n Chain.chain.evolvesTo.first.evolves_to.count --->>> \(chain.chain?.evolves_to?.first?.evolves_to?.count ?? 0) \n")
        print("\n\n Chain.chain.evolvesTo.first.evolves_to.first --->>> \(chain.chain?.evolves_to?.first?.evolves_to?.first ?? Evolves_to()) \n")
        
        let firstStep: ChainDataComplement = chain.chain?.species ?? ChainDataComplement()
        let secondStep: ChainDataComplement = chain.chain?.evolves_to?.first?.species ?? ChainDataComplement()
        let thirdStep: ChainDataComplement = chain.chain?.evolves_to?.first?.evolves_to?.first?.species ?? ChainDataComplement()
        
        print("\n Primera Evolucion --->>> \(firstStep.name) \n")
        print("\n Segunda Evolucion --->>> \(secondStep.name) \n")
        print("\n Tercera Evolucion --->>> \(thirdStep.name) \n")
        
        
        var arrEvolution: [DetailPokemonChain] = []
        
        if chain.chain?.evolves_to?.count == 0 {
            return []
        }else if chain.chain?.evolves_to?.count == 1 && chain.chain?.evolves_to?.first?.evolves_to?.count == 0 {
            print("\n\n\n UNA EVOLUCION \n\n\n")
            var selfEvol =  chain.chain?.evolves_to?.first?.evolution_details?.first ?? Evolution_details()
            var arrNames: [String] = []
            arrNames[0] = firstStep.name ?? ""
            arrNames[1] = secondStep.name ?? ""
            
            var arrEvolDetail: [Evolution_details] = []
            arrEvolDetail.append(selfEvol)
            
            var simpleEvol: DetailPokemonChain = DetailPokemonChain(name: arrNames, eDetail: arrEvolDetail )
            
            print("\n\n\n arrEvolution Contiene --->>> \(arrEvolution) \n\n\n")
            return arrEvolution
        }else if chain.chain?.evolves_to?.first?.evolves_to?.count == 0 {
            
        }else if chain.chain?.evolves_to?.count == 0 {
           
        }
        
        return arrEvolution
        
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
