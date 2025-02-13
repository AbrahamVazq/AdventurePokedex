//  TypesCellTableViewCell.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/25.

import UIKit

class TypesCellTableViewCell: UITableViewCell {
    //MARK: - O U T L E T S
    @IBOutlet weak var viewTypeCell : UIView! { didSet { self.viewTypeCell.cornerRadius = 8 }}
    @IBOutlet weak var lblType : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - S E T · U P
    public func setUpCell(with type: TypePokemonResults, andStyle style: Int = 0) {
        self.lblType.text = type.name?.translate()
        if style != 0 {
            switch style {
            case 1:
                viewTypeCell.backgroundColor = .red
            case 2:
                viewTypeCell.backgroundColor = .green
            case 3:
                viewTypeCell.backgroundColor = .orange
            case 4:
                viewTypeCell.backgroundColor = .lightGray
            default:
                break
            }
        }
    }
}
