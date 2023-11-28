//  AllPokemonViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class AllPokemonViewController: UIViewController {
    //MARK: - O U T L E T S
    @IBOutlet weak var tblAllPokemon: UITableView!

    
    //MARK: - V A R I A B L E S
    var presenter: AllPokemon_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension AllPokemonViewController: AllPokemon_PresenterToViewProtocol {
}
