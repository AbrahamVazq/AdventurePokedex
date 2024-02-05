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

    
    //MARK: - V A R I A B L E S
    var idPokemon: String = ""
    var arrSprites: [String] = []
    var presenter: DetailPokemon_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - W E B · S E R V I C E S
    
    
}

// MARK: - P R E S E N T E R · T O · V I E W
extension DetailPokemonViewController: DetailPokemon_PresenterToViewProtocol {
}
