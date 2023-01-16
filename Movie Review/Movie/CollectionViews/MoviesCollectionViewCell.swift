//
//  MoviesCollectionViewCell.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    
    
    var movieImageView1: UIImageView = {
        let uiview = UIImageView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
            return uiview
        }()
    
    var moviePosterShadowView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .clear
        uiview.translatesAutoresizingMaskIntoConstraints = false
            return uiview
        }()
    
    override init(frame: CGRect) {
      super.init(frame:frame)
        addViews()
      //You Code here
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews(){
        
        
        
        self.addSubview(moviePosterShadowView)
        moviePosterShadowView.backgroundColor = .purple
        moviePosterShadowView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        moviePosterShadowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        moviePosterShadowView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        moviePosterShadowView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        moviePosterShadowView.layer.shadowColor = UIColor.black.cgColor
        moviePosterShadowView.layer.shadowOpacity = 0.6
        moviePosterShadowView.layer.shadowOffset = .zero
        moviePosterShadowView.layer.shadowRadius = 30
        moviePosterShadowView.layer.cornerRadius = 14
        
        moviePosterShadowView.addSubview(movieImageView1)
        movieImageView1.leftAnchor.constraint(equalTo: moviePosterShadowView.leftAnchor).isActive = true
        movieImageView1.rightAnchor.constraint(equalTo: moviePosterShadowView.rightAnchor).isActive = true
        movieImageView1.topAnchor.constraint(equalTo: moviePosterShadowView.topAnchor).isActive = true
        movieImageView1.bottomAnchor.constraint(equalTo: moviePosterShadowView.bottomAnchor).isActive = true
        movieImageView1.backgroundColor = .green
        movieImageView1.layer.cornerRadius = 14
        movieImageView1.layer.masksToBounds = true
        movieImageView1.clipsToBounds = true
        
        
        
    }
    
    
}
