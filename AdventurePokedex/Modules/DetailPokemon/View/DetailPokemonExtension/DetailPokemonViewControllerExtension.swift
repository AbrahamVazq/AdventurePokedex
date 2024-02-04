//  DetailPokemonViewControllerExtension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 18/01/24.

import UIKit

extension DetailPokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrSprites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cCell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonSpriteCollectionViewCell.identifier, 
                                                             for: indexPath) as? PokemonSpriteCollectionViewCell else { return PokemonSpriteCollectionViewCell() }
        cCell.setupSpriteCell(withImage: arrSprites[indexPath.row])
        return cCell
    }
}
