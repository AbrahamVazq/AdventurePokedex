//  PokeRegionViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/02/25.

import UIKit

extension PokeRegionViewController: UITableViewDelegate {
    
}

extension PokeRegionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonOnRegion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableRegion.dequeueCell(withType: AllPokemonTableViewCell.self, for: indexPath) as? AllPokemonTableViewCell ?? AllPokemonTableViewCell()
        cell.setUpCell(with: pokemonOnRegion[indexPath.row])
        return cell
    }
}
