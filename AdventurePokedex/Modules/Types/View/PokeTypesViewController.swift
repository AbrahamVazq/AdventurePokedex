//  PokeTypesViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class PokeTypesViewController: UIViewController {
    
    @IBOutlet weak var typesTableView : UITableView!

    var presenter: PokeTypes_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTypeTable()
    }
    
    private func configureTypeTable() {
        self.title = "Tipos"
        self.typesTableView.delegate = self
        self.typesTableView.dataSource = self
        self.typesTableView.separatorStyle = .none
        self.typesTableView.showsVerticalScrollIndicator = false
        self.typesTableView.register(TypesCellTableViewCell.nib, forCellReuseIdentifier: TypesCellTableViewCell.identifier)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension PokeTypesViewController: PokeTypes_PresenterToViewProtocol {
}
