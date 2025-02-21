//  ChoosePokedexViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 21/02/25.

import UIKit

extension ChoosePokedexViewController: UITableViewDelegate {
    
}

extension ChoosePokedexViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRegions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableChooseRegion.dequeueCell(withType: ChoosePokedexTableViewCell.self.self, for: indexPath) as? ChoosePokedexTableViewCell ?? ChoosePokedexTableViewCell()
        return cell
    }
}
