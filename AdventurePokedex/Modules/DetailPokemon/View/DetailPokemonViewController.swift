//  DetailPokemonViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class DetailPokemonViewController: UIViewController {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwTopContainer: UIView!
    @IBOutlet weak var cvPokemon: UICollectionView!
    @IBOutlet weak var lblNamePokemon: UILabel!
    @IBOutlet weak var lblTypesPokemon: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet private weak var vwChainEvol: UIView!

    //MARK: - V A R I A B L E S
    var idPokemon: String = ""
    var idSpecie: String = ""
    var evolNumber: Int = 0
    var arrSprites: [String] = []
    var arrURLsSprites: [String] = []
    var switchToMainSprite: Bool = false
    var presenter: DetailPokemon_ViewToPresenterProtocol?
    
    // MARK: Lifecycle
    override func viewDidLoad() { 
        super.viewDidLoad()
        self.setUpCollectionView()
        self.presenter?.getToSprites(with: idPokemon)
        self.updateChainEvolution(withIDSpecie: self.idSpecie)
    }
    
    private func setUpCollectionView(){
        self.cvPokemon.dataSource = self
        self.cvPokemon.register(PokemonSpriteCollectionViewCell.nib, forCellWithReuseIdentifier: PokemonSpriteCollectionViewCell.identifier)
    }
    
    private func returnTypes(from pokemonInfo: SpritesPokemonResponse) -> String {
        guard let types = pokemonInfo.types else { return "" }
        return "\(types.first?.type?.name?.translate() ?? "") \(types.count == 2 ? "/ \(types.last?.type?.name?.translate() ?? "" )" : "" )"
    }
    
    private func addSimpleChain(withState state: Bool = false, trigger: Bool = false, andDetailPokemonChain detailPokemonChain : DetailPokemonChain ) {
        let evolutionView = state ?  ChainDouble.instantiate(with: detailPokemonChain, evolTrade: trigger) : ChainSimple.instantiate(with: detailPokemonChain )
        evolutionView.frame = vwChainEvol.bounds
        self.vwChainEvol.addSubview(evolutionView)
        vwChainEvol.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [evolutionView.leadingAnchor.constraint(equalTo: vwChainEvol.leadingAnchor),
             evolutionView.trailingAnchor.constraint(equalTo: vwChainEvol.trailingAnchor),
             evolutionView.topAnchor.constraint(equalTo: vwChainEvol.topAnchor),
             evolutionView.bottomAnchor.constraint(equalTo: vwChainEvol.bottomAnchor),
            ])
    }
    
    private func addNoChain() {
        let noEvolution = NoChain.instantiate()
        self.vwChainEvol.addSubview(noEvolution)
        noEvolution.frame = vwChainEvol.bounds
        vwChainEvol.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [noEvolution.leadingAnchor.constraint(equalTo: vwChainEvol.leadingAnchor),
             noEvolution.trailingAnchor.constraint(equalTo: vwChainEvol.trailingAnchor),
             noEvolution.topAnchor.constraint(equalTo: vwChainEvol.topAnchor),
             noEvolution.bottomAnchor.constraint(equalTo: vwChainEvol.bottomAnchor),
            ])
    }
    
    private func updateChainEvolution(withIDSpecie id: String) {
        self.presenter?.getToChainEvol(with: id)
    }

}


// MARK: - P R E S E N T E R · T O · V I E W
extension DetailPokemonViewController: DetailPokemon_PresenterToViewProtocol {
    func updateInfo(onPokemon pokemonInfo: SpritesPokemonResponse) {
        self.arrSprites = self.arrSprites.returnSprites(fromSprites: pokemonInfo.sprites ?? SpritesResponse())
        DispatchQueue.main.async {
            self.lblNamePokemon.text = "#\(pokemonInfo.id.nilCoalesced) \(pokemonInfo.name?.capitalized ?? "")"
            self.lblHeight.text = String(format: "Altura promedio: %.2f m.", ((pokemonInfo.height?.returnDouble() ?? 0.0) * 0.1) )
            self.lblWeight.text = String(format: "Peso promedio: %.2f kg", ((pokemonInfo.weight?.returnDouble() ?? 0.0) * 0.1) )
            self.lblTypesPokemon.text = self.returnTypes(from: pokemonInfo)
            self.cvPokemon.reloadData()
        }
    }
    
    func updateInfo(withChain chain: DetailPokemonChain,trigger: String, andDetail: [String]) {
        DispatchQueue.main.async {
            if let count = chain.name?.count, count > 0 { 
                self.addSimpleChain(withState: chain.name?.count == 3, trigger: trigger == "trade", andDetailPokemonChain: chain)
            } else { self.addNoChain() }
        }
    }
    
    func updateErrorService(withError error: NSError) {
        DispatchQueue.main.async {
            self.showAlert(andMessage: error.localizedDescription)
        }
    }
}
