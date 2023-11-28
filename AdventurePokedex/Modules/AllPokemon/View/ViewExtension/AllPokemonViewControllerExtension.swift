//  AllPokemonViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

extension AllPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrAllPokemon.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: AllPokemonTableViewCell.self, 
                                         for: indexPath) as? AllPokemonTableViewCell ?? AllPokemonTableViewCell()
        cell.setUpCell(with: self.arrAllPokemon[indexPath.row])
        return cell
    }
    
    
}
