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
    @IBOutlet weak var lblTypePokemon: UILabel!
    @IBOutlet weak var lblTypesPokemon: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!

    //MARK: - V A R I A B L E S
    var idPokemon: String = ""
    var arrSprites: [String] = []
    var presenter: DetailPokemon_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCollectionView()
        self.presenter?.getToSprites(with: idPokemon)
    }
    
    private func setUpCollectionView(){
        self.cvPokemon.dataSource = self
        self.cvPokemon.register(PokemonSpriteCollectionViewCell.nib,
                            forCellWithReuseIdentifier: PokemonSpriteCollectionViewCell.identifier)
    }
    
    private func returnTypes(from pokemonInfo: SpritesPokemonResponse) -> String {
        guard let types = pokemonInfo.types else { return "" }
        return "\(types.first?.type?.name?.translate() ?? "") / \(types.count == 2 ? types.last?.type?.name?.translate() ?? "" : "" )"
    }
    
}


// MARK: - P R E S E N T E R · T O · V I E W
extension DetailPokemonViewController: DetailPokemon_PresenterToViewProtocol {
    func updateInfo(onPokemon pokemonInfo: SpritesPokemonResponse) {
        self.arrSprites = self.arrSprites.returnSprites(fromSprites: pokemonInfo.sprites ?? SpritesResponse())
        DispatchQueue.main.async {
            self.lblNamePokemon.text = "#\(pokemonInfo.id.nilCoalesced) \(pokemonInfo.name?.capitalized.nilCoalesced ?? "")"
            self.lblHeight.text = String(format: "Altura promedio: %.2f m.", ((pokemonInfo.height?.returnDouble() ?? 0.0) * 0.1) )
            self.lblWeight.text = String(format: "Peso promedio: %.2f kg", ((pokemonInfo.weight?.returnDouble() ?? 0.0) * 0.1) )
            self.lblTypesPokemon.text = self.returnTypes(from: pokemonInfo)
            self.cvPokemon.reloadData()
        }
    }    
}
