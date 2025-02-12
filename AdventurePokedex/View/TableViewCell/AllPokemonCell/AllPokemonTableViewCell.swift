//  AllPokemonTableViewCell.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

class AllPokemonTableViewCell: UITableViewCell {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainter: UIView! { didSet { self.vwContainter.cornerRadius = 12 }}
    @IBOutlet weak var lblNamePokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - S E T · U P
    public func setUpCell(with pokemon: AllPokemonEntries?) {
        self.vwContainter.cornerRadius = 5.0
        self.lblNamePokemon.text = "#\(pokemon?.entry_number ?? 0) - \(pokemon?.pokemon_species?.name?.capitalized ?? "")"
    }
    
}
