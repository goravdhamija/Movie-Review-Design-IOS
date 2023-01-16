//
//  KefactsCollectionView.swift
//  Movie Review
//
//  Created by Globeways Technologies on 14/01/23.
//

import UIKit

class KefactsCollectionView:  UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    
    var keyFactsArray:[KeyfactsData] = [KeyfactsData]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyFactsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeyfactsCollectionViewCell", for: indexPath) as? KeyfactsCollectionViewCell else {
                     return UICollectionViewCell()
                }

        myCell.backgroundColor = UIColor.systemGray6
        myCell.layer.cornerRadius = 12
        myCell.clipsToBounds = true
        
        myCell.titleLabel.text = keyFactsArray[indexPath.row].title!
        myCell.valueLabel.text = keyFactsArray[indexPath.row].value!
        
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
        
            return CGSize(width: 158, height: 70)
        }
    
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
        }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 12
        }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 12
        }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
