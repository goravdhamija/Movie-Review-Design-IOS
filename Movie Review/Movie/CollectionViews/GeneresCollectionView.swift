//
//  GeneresCollectionView.swift
//  Movie Review
//
//  Created by Globeways Technologies on 14/01/23.
//

import UIKit

class GeneresCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    
    var generesArray:[String] = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        generesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneresCollectionViewCell", for: indexPath) as? GeneresCollectionViewCell else {
                     return UICollectionViewCell()
                }

        myCell.backgroundColor = UIColor.systemGray6
        myCell.layer.cornerRadius = 12.5
        myCell.clipsToBounds = true
        
        myCell.titleLabel.text = generesArray[indexPath.item]
        
        return myCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            print("User tapped on item \(indexPath.row)")
        }
        
    
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
         //   return CGSize(width: collectionView.bounds.width, height: 44)
        return CGSize(width: generesArray[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 18, height: 25)
           // return CGSize(width: 158, height: 70)
        }
    
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
        }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
