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
    public func setUpCell(with type: String) {
        self.lblType.text = type
    }
}
