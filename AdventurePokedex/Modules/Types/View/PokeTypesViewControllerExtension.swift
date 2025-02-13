//  PokeTypesViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/25.

import UIKit

extension PokeTypesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let typeTapped = types[indexPath.row]
        self.presenter?.didSelect(withType: typeTapped)
    }
}

extension PokeTypesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = typesTableView.dequeueCell(withType: TypesCellTableViewCell.self, for: indexPath) as? TypesCellTableViewCell ?? TypesCellTableViewCell()
        cell.setUpCell(with: self.types[indexPath.row])
        return cell
    }
}
