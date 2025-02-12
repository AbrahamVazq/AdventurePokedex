//  PokeTypesViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/25.

import UIKit

extension PokeTypesViewController: UITableViewDelegate {
    
}

extension PokeTypesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = typesTableView.dequeueCell(withType: TypesCellTableViewCell.self, for: indexPath) as? TypesCellTableViewCell ?? TypesCellTableViewCell()
        cell.setUpCell(with: "Tipo Pokemon")
        return cell
    }
    
    
}
