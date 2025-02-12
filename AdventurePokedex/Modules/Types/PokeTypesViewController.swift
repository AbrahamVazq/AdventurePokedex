//  PokeTypesViewController.swift
//  AdventurePokedex
//
//  Created by Abraham Vazquez on 12/02/25.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class PokeTypesViewController: UIViewController {

    var presenter: PokeTypes_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension PokeTypesViewController: PokeTypes_PresenterToViewProtocol {
}
