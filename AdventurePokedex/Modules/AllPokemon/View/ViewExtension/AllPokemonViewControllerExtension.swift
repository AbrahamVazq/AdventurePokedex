//  AllPokemonViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

extension AllPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: AllPokemonTableViewCell.self, for: indexPath) else { return UITableViewCell()}
        return cell
    }
    
    
}
