//  ChainSimple.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import UIKit

class ChainSimple: UIView {
    //MARK: - O U T L E T S
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet private weak var lblLevel: UILabel!
    @IBOutlet private weak var lblNamePokemon: UILabel!
    @IBOutlet private weak var imgPokemon: UIImageView!
    
    override func awakeFromNib() { }
    
    class func instantiate(with obj: NSObject) -> ChainSimple {
        if let nib = Bundle.main.loadNibNamed(ChainSimple.identifier,  owner: self, options: nil)?[0] as? ChainSimple { return nib }
        return ChainSimple()
    }

}
