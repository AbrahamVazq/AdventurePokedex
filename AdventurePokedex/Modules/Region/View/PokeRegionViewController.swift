//  PokeRegionViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class PokeRegionViewController: UIViewController {
    @IBOutlet weak var tableRegion : UITableView!
    
    var presenter: PokeRegion_ViewToPresenterProtocol?
    var region: PokeGeneral = PokeGeneral()
    var pokemonOnRegion: [Pokemon_entries] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = region.name?.capitalized
        self.presenter?.goToRegion(withId:"\(region.url?.returnIDwithURL() ?? "")")
        self.setUpTableRegion()
    }
    
    private func setUpTableRegion() {
        self.tableRegion.dataSource = self
        self.tableRegion.separatorStyle = .none
        self.tableRegion.showsVerticalScrollIndicator = false
        self.tableRegion.register(AllPokemonTableViewCell.nib, forCellReuseIdentifier: AllPokemonTableViewCell.identifier)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension PokeRegionViewController: PokeRegion_PresenterToViewProtocol {
    func udopateView(withRegion region: RegionDetailResponse) {
        self.pokemonOnRegion = region.pokemon_entries ?? []
        DispatchQueue.main.async {
            self.tableRegion.reloadData()
        }
    }
    
    func updateErrorService(withError error: NSError) {
        DispatchQueue.main.async {
            self.showAlert(andMessage: error.localizedDescription)
        }
    }
}
