//  AllPokemonViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

//MARK: - UI · T A B L E · V I E W · D E L E G A T E S
extension AllPokemonViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.idPokemon = self.isFiltering ? arrFilterPokemon?[indexPath.row].entry_number ?? 0  : arrAllPokemon[indexPath.row].entry_number ?? 0
        self.presenter?.getToSpecie(with: "\(idPokemon)")
    }
}


//MARK: - UI · T A B L E · V I E W · D A T A S O U R C E
extension AllPokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? arrFilterPokemon?.count ?? 0  : arrAllPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: AllPokemonTableViewCell.self, 
                                         for: indexPath) as? AllPokemonTableViewCell ?? AllPokemonTableViewCell()
        let arrPokemon = isFiltering ? arrFilterPokemon : arrAllPokemon
        cell.setUpCell(with: arrPokemon?[indexPath.row])
        return cell
    }
}


//MARK: - UI · S E A R C H · R E S U L T
extension AllPokemonViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = search.searchBar
        searchPokemon(with: searchBar.text.nilCoalesced)
    }
    
    func searchPokemon(with agreement: String) {
        arrFilterPokemon = (arrAllPokemon.filter({ (pokemon : AllPokemonEntries) -> Bool in
            return (pokemon.pokemon_species?.name?.lowercased().contains(agreement.lowercased()) ?? false)
        }))
        tblAllPokemon.reloadData()
    }
}
