//  TypeDetailViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class TypeDetailViewController: UIViewController {

    @IBOutlet weak var tableDetailType : UITableView!
    
    var presenter: TypeDetail_ViewToPresenterProtocol?
    var type: PokeGeneral?
    var damageRelation: DamageRelations?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = type?.name?.translate() ?? "Type"
        if let idType = type?.url?.returnIDwithURL() {
            self.presenter?.goToTypeDetail(with: idType)
        } else { return }
        self.setUpTableDetail()
    }
    
    private func setUpTableDetail() {
        self.tableDetailType.delegate = self
        self.tableDetailType.dataSource = self
        self.tableDetailType.separatorStyle = .none
        self.tableDetailType.showsVerticalScrollIndicator = false
        self.tableDetailType.register(TypesCellTableViewCell.nib, forCellReuseIdentifier: TypesCellTableViewCell.identifier)
    }
    
}

// MARK: - P R E S E N T E R · T O · V I E W
extension TypeDetailViewController: TypeDetail_PresenterToViewProtocol {
    func updateView(withDetail detail: TypesDetailResponse) {
        guard let types = detail.damageRelations   else { return }
        DispatchQueue.main.async {
            self.damageRelation = types
            self.tableDetailType.reloadData()
        }
    }
    
    func updateErrorService(withError error: NSError) {
        DispatchQueue.main.async {
            self.showAlert(andMessage: error.localizedDescription)
        }
    }
}
