//  AllPokemonTableViewCell.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

class AllPokemonTableViewCell: UITableViewCell {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainter: UIView!
    @IBOutlet weak var lblNamePokemon: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
