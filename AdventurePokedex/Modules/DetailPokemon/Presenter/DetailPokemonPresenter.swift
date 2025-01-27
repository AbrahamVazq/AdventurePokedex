//  DetailPokemonPresenter.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class DetailPokemonPresenter: DetailPokemon_ViewToPresenterProtocol {
    
    weak var view: DetailPokemon_PresenterToViewProtocol?
    var interactor: DetailPokemon_PresenterToInteractorProtocol?
    var router: DetailPokemon_PresenterToRouterProtocol?
    var arrSimpleDetail: [String] = []
    var trigger: String = ""
    
    func getToSprites(with id: String) {
        interactor?.getToSpritesToInteractor(with: id)
    }
    
    func getToChainEvol(with id: String) {
        interactor?.getToChainEvolToInteracto(with: id)
    }
    
    private func returnChainEvolution(withChain chain: ChainEvolutionResponse) -> DetailPokemonChain {
        if chain.chain?.evolves_to?.count == 0 { return DetailPokemonChain() }
        var objEvolution: DetailPokemonChain = DetailPokemonChain()
        objEvolution.name = setEvolutionNames(withChain: chain)
        objEvolution.eDetail = setEvolutionDetails(withChain: chain)
        return objEvolution
    }
    
    func setEvolutionNames(withChain chain: ChainEvolutionResponse) -> [String] {
        var arrNames: [String] = [String]()
        arrNames.insert(chain.chain?.species?.name ?? "", at: 0)
        arrNames.insert(chain.chain?.evolves_to?.first?.species?.name ?? "", at: 1)
        arrNames.insert(chain.chain?.evolves_to?.first?.evolves_to?.first?.species?.name ?? "", at: 2)
        arrNames = arrNames.filter({ $0 != ""})
        return arrNames
    }
    
    func setEvolutionDetails(withChain chain:  ChainEvolutionResponse) -> [Evolution_details] {
        var arrDetails:[Evolution_details] = [Evolution_details]()
        arrDetails.insert(chain.chain?.evolves_to?.first?.evolution_details?.first ?? Evolution_details(), at: 0)
        if let evolDetail = chain.chain?.evolves_to?.first?.evolves_to?.first?.evolution_details?.first {
            arrDetails.insert(evolDetail, at: 1)
            arrSimpleDetail = cleanNilsFrom(dictionary: propertiesNoNil(evolDetail))
            self.trigger = evolDetail.trigger?.name ?? ""
        }
        return arrDetails
    }
    
    func propertiesNoNil(_ obj: Evolution_details) -> [String: Any] {
        let mirror = Mirror(reflecting: obj)
        var resultado:[String:Any ] = [:]
        for (property, value) in mirror.children {
            if let propertyName = property, let noNilValue = value as Any? {
                resultado[propertyName] = noNilValue
            }
        }
        return resultado
    }

    func cleanNilsFrom(dictionary dct: [String: Any]) -> [String] {
        var arrResult: [String] = []
        let _: [String: Any] = dct.compactMapValues { value in
            arrResult.append("\(value)")
            arrResult = arrResult.filter({ $0 != "nil"})
            return arrResult
        }
        return arrResult
    }
    
    func getTrigger(onEvol triger:ChainDataComplement) -> String {
        return triger.name ?? ""
    }

}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension DetailPokemonPresenter: DetailPokemon_InteractorToPresenterProtocol {
    func getPokemonInfoFromInteractor(onPokemon pokemonInfo: SpritesPokemonResponse) {
        view?.updateInfo(onPokemon: pokemonInfo)
    }

    func getChainEvolInfoFromInteractor(withChain chain: ChainEvolutionResponse) {
        let chain: DetailPokemonChain = self.returnChainEvolution(withChain: chain)
        let arrFinalDetail = self.arrSimpleDetail
        let trigger = self.trigger
        view?.updateInfo(withChain: chain, trigger: trigger , andDetail: arrFinalDetail)
    }
    
    func getErrorFromInteractor(withError error: NSError) {
        view?.updateErrorService(withError: error)
    }
}
