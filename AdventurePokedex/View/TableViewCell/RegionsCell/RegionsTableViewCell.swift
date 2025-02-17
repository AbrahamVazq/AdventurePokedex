//  RegionsTableViewCell.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 14/02/25.

import UIKit

class RegionsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var vwRegionCell : UIView!
    @IBOutlet private weak var lblRegion : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - S E T · U P
    public func setUpCell(with pokemon: PokeGeneral?) {
        self.vwRegionCell.cornerRadius = 5.0
        self.lblRegion.text = pokemon?.name?.capitalized
    }
}
