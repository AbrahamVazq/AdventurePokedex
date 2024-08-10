//  NoChain.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 23/07/24.

import UIKit

class NoChain: UIView {
    //MARK: - O U T L E T S
    @IBOutlet private weak var vwContainer: UIView!
    @IBOutlet private weak var imgNoChain: UIImageView!
    @IBOutlet private weak var lblTitleNoChain: UILabel!

    override func awakeFromNib() { }
    
    class func instantiate() -> NoChain {
        if let nib = Bundle.main.loadNibNamed(NoChain.identifier,  owner: self, options: nil)?[0] as? NoChain { return nib }
        return NoChain()
    }
}
