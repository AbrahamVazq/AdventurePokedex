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
    let search = UISearchController(searchResultsController: nil)
    var isSearchEmpty : Bool {return search.searchBar.text?.isEmpty ?? true}
    var isFiltering : Bool {return search.isActive && !isSearchEmpty}
    var arrAllPokemon: [AllPokemonEntries] = []
    var arrFilterPokemon: [AllPokemonEntries]?
    var idSpecie: String = ""
    var idPokemon: Int = 0
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.setUpSearchBar()
        self.setUpSearchBarProperties()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.activityStartAnimating()
        
        if !(arrAllPokemon.count != 0) {
            presenter?.viewDidLoad()
        } else { self.view.activityStopAnimating() }
    }
    
    //MARK: - S E T · U P · V I E W
    private func setTableView(){
        self.title = "Pokemón Adventures"
        self.tblAllPokemon.delegate = self
        self.tblAllPokemon.dataSource = self
        self.tblAllPokemon.separatorStyle = .none
        self.tblAllPokemon.showsVerticalScrollIndicator = false
        self.tblAllPokemon.registerCell(type: AllPokemonTableViewCell.self, identifier: AllPokemonTableViewCell.identifier)
    }
    
    private func setUpSearchBar() {
        self.search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.searchTextField.placeholder = "Pokémon"
        self.navigationItem.searchController = search
        definesPresentationContext = true
    }
    
    private func setUpSearchBarProperties() {
        search.automaticallyShowsCancelButton = true
        search.automaticallyShowsScopeBar = true
        search.automaticallyShowsSearchResultsController = true
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension AllPokemonViewController: AllPokemon_PresenterToViewProtocol {
    func updateView(from pokemon: AllPokemonResponse) {
        guard let pokemon = pokemon.pokemonEntries else { return }
        DispatchQueue.main.async {
            self.arrAllPokemon = pokemon
            self.view.activityStopAnimating()
            self.tblAllPokemon.reloadData()
        }
    }
    
    func updateInfo(withSpecie specie: SpeciesPokemonResponse) {
        self.idSpecie = specie.evolution_chain?.url?.returnIDToSpecieChain() ?? ""
        DispatchQueue.main.async {
            if self.idSpecie != "" {
                self.presenter?.didSelect(atIndex: self.idPokemon, andIdSpecie: self.idSpecie)
            }
        }
    }
    
    func update(with error: Error) {
        DispatchQueue.main.async {
            self.showAlert(andMessage: error.localizedDescription)
        }
    }
}
