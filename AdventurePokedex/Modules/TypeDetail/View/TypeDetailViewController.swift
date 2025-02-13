//  TypeDetailViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class TypeDetailViewController: UIViewController {

    var presenter: TypeDetail_ViewToPresenterProtocol?
    var type: TypePokemonResults?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = type?.name?.translate() ?? "Type"
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension TypeDetailViewController: TypeDetail_PresenterToViewProtocol {
}
