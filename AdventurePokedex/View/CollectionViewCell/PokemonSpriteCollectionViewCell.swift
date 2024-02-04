//  PokemonSpriteCollectionViewCell.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.

import UIKit

class PokemonSpriteCollectionViewCell: UICollectionViewCell {
    
    //MARK: - O U T L E T S
    @IBOutlet private weak var vwContainer: UIView! {
        didSet { self.vwContainer.cornerRadius = 5 }
    }
    
    @IBOutlet private weak var imgPokemon: UIImageView! {
        didSet {
            self.imgPokemon.cornerRadius = 5
            self.imgPokemon.backgroundColor = .clear }
    }
    
    //MARK: - V A R I A B L E S
    private var downloadTask: URLSessionDownloadTask?
    private var url: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
        url = ""
    }
    
    func setupSpriteCell(withImage img: String){
        self.url = img
        self.downloadTask = imgPokemon.loadImage(strURL: url)
    }
}
