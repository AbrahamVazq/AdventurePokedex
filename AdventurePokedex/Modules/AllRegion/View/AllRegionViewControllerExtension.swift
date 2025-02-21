//  AllRegionViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.

import UIKit

extension AllRegionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.presenter?.didSelect(withRegion: Array().returnArraysRegion(fromId: indexPath.row))
//        let idRegion = arrAllRegions[indexPath.row].url
        self.presenter?.didSelect(withRegion: indexPath.row + 1, orPokeRegion: indexPath.row + 1 == 9 ? arrAllRegions[indexPath.row] : PokeGeneral())
    }
}

extension AllRegionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAllRegions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableAllRegions.dequeueCell(withType: RegionsTableViewCell.self, for: indexPath) as? RegionsTableViewCell ?? RegionsTableViewCell()
        cell.setUpCell(with: arrAllRegions[indexPath.row])
        return cell
    }
}
