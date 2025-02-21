//  ChoosePokedexViewController.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 21/02/25.
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class ChoosePokedexViewController: UIViewController {
    
    @IBOutlet private weak var viewContainer : UIView!
    @IBOutlet weak var tableChooseRegion : UITableView!

    var presenter: ChoosePokedex_ViewToPresenterProtocol?
    var idToShowRegion: Int = 0
    var arrRegions: [PokeGeneral] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n\n  idToShowRegionq  ---->>>> \(self.idToShowRegion) \n\n")
        self.arrRegions = setRegionToShow(withId: idToShowRegion)
        self.setUpViewContainer()
        self.setUpTableChooseRegion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        self.arrRegions = setRegionToShow(withId: idToShowRegion)
        self.tableChooseRegion.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super .viewDidDisappear(animated)
        self.idToShowRegion = 0
    }
    
    private func setUpViewContainer() {
        self.viewContainer.cornerRadius = 10
    }
    
    private func setUpTableChooseRegion() {
        self.tableChooseRegion.delegate = self
        self.tableChooseRegion.dataSource = self
        self.tableChooseRegion.separatorStyle = .none
        self.tableChooseRegion.register(ChoosePokedexTableViewCell.nib, forCellReuseIdentifier: ChoosePokedexTableViewCell.identifier)
    }
    
    private func setRegionToShow(withId id:Int) -> [PokeGeneral] {
        var arrFinal: [PokeGeneral]  = []
        arrFinal = arrFinal.returnArraysRegion(fromId: "\(id)" )
        return arrFinal
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension ChoosePokedexViewController: ChoosePokedex_PresenterToViewProtocol {
}
