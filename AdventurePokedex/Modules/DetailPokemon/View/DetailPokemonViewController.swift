//  DetailPokemonViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class DetailPokemonViewController: UIViewController {

    var presenter: DetailPokemon_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension DetailPokemonViewController: DetailPokemon_PresenterToViewProtocol {
}
