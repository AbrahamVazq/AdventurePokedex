//  ChainSimple.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import UIKit

class ChainSimple: UIView {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet private weak var lblTitleOne: UILabel!
    @IBOutlet private weak var lblTitleTwo: UILabel!
    @IBOutlet private weak var lblLevelOne: UILabel!
    @IBOutlet private weak var lblLevelTwo: UILabel!
    @IBOutlet private weak var imgPkmnOne: UIImageView!
    @IBOutlet private weak var imgPkmnTwo: UIImageView!
    @IBOutlet private weak var imgArrow : UIImageView!
    
    override func awakeFromNib() { }
    
    class func instantiate(with obj: DetailPokemonChain) -> ChainSimple {
        if let nib = Bundle.main.loadNibNamed(ChainSimple.identifier,  owner: self, options: nil)?.first as? ChainSimple {
            nib.lblTitleOne.text = obj.name?.first?.capitalized
            nib.lblTitleTwo.text = obj.name?.last?.capitalized
            return nib }
        return ChainSimple()
    }

}
