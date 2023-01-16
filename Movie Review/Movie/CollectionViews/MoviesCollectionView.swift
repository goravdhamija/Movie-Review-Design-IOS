//
//  MoviesCollectionView.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit

class MoviesCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    var moviesCollection:[MovieData] = [MovieData]()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell else {
                     return UICollectionViewCell()
                }

       myCell.backgroundColor = UIColor.clear
        
        
        Utils.insertDisplayableImageInImageView(remoteURLString: moviesCollection[indexPath.row].posterUrl!, toFolder: "movies", atImageView: myCell.movieImageView1, defaultIOSImage: "popcorn.fill")
        

        let showFavoriteMovieGesture = MyTapGesture(target: self, action: #selector(self.showFavoriteMovieGestureTap(_:)))
        myCell.addGestureRecognizer(showFavoriteMovieGesture)
        myCell.isUserInteractionEnabled = true
        showFavoriteMovieGesture.selectedIndex = indexPath.row

        
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
        
            return CGSize(width: 212, height: 270)
        }
    
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
        }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 30
        }

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    
    
    
    
    
    @objc func showFavoriteMovieGestureTap(_ sender: MyTapGesture? = nil){
        let selectedIndexRow = sender?.selectedIndex

        let indexPath = IndexPath(row: selectedIndexRow!, section: 0)
        let cell = self.cellForItem(at: indexPath) as! MoviesCollectionViewCell
        
        let secondVC = DetailViewController(movieData: moviesCollection[selectedIndexRow!])
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .coverVertical
        secondVC.view.isOpaque = false
        
        UIApplication.getTopViewController()!.present(secondVC, animated: true)
        
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
