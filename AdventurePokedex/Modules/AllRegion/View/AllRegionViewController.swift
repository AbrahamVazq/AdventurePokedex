//  AllRegionViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class AllRegionViewController: UIViewController {
    
    @IBOutlet weak var tableAllRegions : UITableView!

    var presenter: AllRegion_ViewToPresenterProtocol?
    var arrAllRegions: [PokeGeneral] = []
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regiones"
        self.presenter?.goToTypes()
        self.configureRegionTable()
    }
    
    private func configureRegionTable() {
        self.tableAllRegions.delegate = self
        self.tableAllRegions.dataSource = self
        self.tableAllRegions.separatorStyle = .none
        self.tableAllRegions.showsVerticalScrollIndicator = false
        self.tableAllRegions.register(RegionsTableViewCell.nib, forCellReuseIdentifier: RegionsTableViewCell.identifier)
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension AllRegionViewController: AllRegion_PresenterToViewProtocol {
    func updateView(WithRegions regions: AllRegionResponse) {
        self.arrAllRegions = regions.results ?? []
        DispatchQueue.main.async {
            self.tableAllRegions.reloadData()
        }
    }
    
    func updateErrorService(withError error: NSError) {
        DispatchQueue.main.async {
            self.showAlert(andMessage: error.localizedDescription)
        }
    }
    
}
