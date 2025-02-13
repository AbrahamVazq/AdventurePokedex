//  TypeDetailViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 13/02/25.

import UIKit

extension TypeDetailViewController: UITableViewDelegate {}

extension TypeDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objCount(fromObj: damageRelation ?? DamageRelations())
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Doble Daño de"
        case 1:
            return "Doble Daño a"
        case 2:
            return "Medio Daño de"
        case 3:
            return "Medio Daño a"
        case 4:
            return "No Recibe Daño de"
        case 5:
            return "No Hace Daño a"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.damageRelation?.double_damage_from?.count ?? 0
        case 1:
            return self.damageRelation?.double_damage_to?.count ?? 0
        case 2:
            return self.damageRelation?.half_damage_from?.count ?? 0
        case 3:
            return self.damageRelation?.half_damage_to?.count ?? 0
        case 4:
            return self.damageRelation?.no_damage_from?.count ?? 0
        case 5:
            return self.damageRelation?.no_damage_to?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableDetailType.dequeueCell(withType: TypesCellTableViewCell.self, for: indexPath) as? TypesCellTableViewCell ?? TypesCellTableViewCell()
        switch indexPath.section {
        case 0:
            if let types = self.damageRelation?.double_damage_from, types.count > 0 {
                cell.setUpCell(with: types[indexPath.row], andStyle: 1)
            }
        case 1:
            if let types = self.damageRelation?.double_damage_to, types.count > 0 {
                cell.setUpCell(with: types[indexPath.row], andStyle: 2)
            }
        case 2:
            if let types = self.damageRelation?.half_damage_from, types.count > 0 {
                cell.setUpCell(with: types[indexPath.row], andStyle: 3)
            }
        case 3:
            if let types = self.damageRelation?.half_damage_to, types.count > 0 {
                cell.setUpCell(with: types[indexPath.row], andStyle: 2)
            }
        case 4:
            if let types = self.damageRelation?.no_damage_from, types.count > 0 {
                cell.setUpCell(with: types[indexPath.row], andStyle: 4)
            }
        case 5:
            if let types = self.damageRelation?.no_damage_to, types.count > 0 {
                cell.setUpCell(with: types[indexPath.row], andStyle: 4)
            }
        default:
            var damateEmpty: TypePokemonResults = TypePokemonResults()
            damateEmpty.name = "No Aplica"
            cell.setUpCell(with: damateEmpty)
        }
        return cell
    }
    
    func objCount(fromObj obj: DamageRelations) -> Int {
        let mirror = Mirror(reflecting: obj)
        return mirror.children.count
    }
    
}
