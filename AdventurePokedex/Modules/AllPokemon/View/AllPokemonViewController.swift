//  AllPokemonViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 27/11/23.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class AllPokemonViewController: UIViewController {
    //MARK: - O U T L E T S
    @IBOutlet weak var tblAllPokemon: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK: - V A R I A B L E S
    var presenter: AllPokemon_ViewToPresenterProtocol?
    var arrAllPokemon: [AllPokemonEntries] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        presenter?.viewDidLoad()
    }
    
    //MARK: - S E T · U P · V I E W
    private func setTableView(){
        self.tblAllPokemon.dataSource = self
        self.tblAllPokemon.registerCell(type: AllPokemonTableViewCell.self, identifier: AllPokemonTableViewCell.identifier)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension AllPokemonViewController: AllPokemon_PresenterToViewProtocol {
    func updateView(from pokemon: AllPokemonResponse) {
        guard let pokemon = pokemon.pokemonEntries else { return }
        self.arrAllPokemon = pokemon
        DispatchQueue.main.async {
            self.tblAllPokemon.reloadData()
        }
    }
    
    func update(with error: Error) {
        self.showAlert(andMessage: error.localizedDescription)
    }
    
}
