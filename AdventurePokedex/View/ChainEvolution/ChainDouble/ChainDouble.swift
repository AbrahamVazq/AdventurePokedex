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
    @IBOutlet private weak var lblbTitleThree : UILabel!
    @IBOutlet private weak var imgPkmnOne: UIImageView!
    @IBOutlet private weak var imgPkmnTwo: UIImageView!
    @IBOutlet private weak var imgPkmnThree: UIImageView!

    override func awakeFromNib() { }
    
    class func instantiate(with obj: DetailPokemonChain, evolTrade: Bool = false) -> ChainDouble {
        if let nib = Bundle.main.loadNibNamed(ChainDouble.identifier,  owner: self, options: nil)?[0] as? ChainDouble {
            nib.imgPkmnOne.image = UIImage(systemName: "arrow.right")
            nib.imgPkmnTwo.image = UIImage(named: "arrowshape.right.circle.fill")
            nib.lblTitleOne.text = obj.name?.first?.capitalized
            nib.lblTitleTwo.text = obj.name?[1].capitalized
            nib.lblbTitleThree.text = obj.name?.last?.capitalized
            nib.lblLevelOne.text = "Nivel: \(obj.eDetail?.first?.min_level ?? 0)"
            nib.lblLevelTwo.text = evolTrade ? "Intercambio" : "Nivel: \(obj.eDetail?.last?.min_level ?? 0)"
            return nib
        }
        return ChainDouble()
    }
}
