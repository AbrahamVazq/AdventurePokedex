//  ChainDouble.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 07/05/24.

import UIKit

class ChainDouble: UIView {
    //MARK: - O U T L E T S
    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var lblTitleOne: UILabel!
    @IBOutlet private weak var lblTitleTwo: UILabel!
    @IBOutlet private weak var lblLevelOne: UILabel!
    @IBOutlet private weak var lblLevelTwo: UILabel!
    @IBOutlet private weak var imgPkmnOne: UIImageView!
    @IBOutlet private weak var imgPkmnTwo: UIImageView!
    @IBOutlet private weak var arrowToEvolve: UIImageView! { didSet { self.arrowToEvolve.image = UIImage(named: "arrowshape.right.fill", in: .main, with: .none) } }

    override func awakeFromNib() { }
    
    class func instantiate(with obj: NSObject) -> ChainDouble {
        if let nib = Bundle.main.loadNibNamed(ChainDouble.identifier,  owner: self, options: nil)?[0] as? ChainDouble { return nib }
        return ChainDouble()
    }
}
