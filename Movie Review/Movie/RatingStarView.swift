//
//  RatingStarView.swift
//  Movie Review
//
//  Created by Globeways Technologies on 14/01/23.
//

import UIKit

class RatingStarView: UIView {
    
    var size:CGFloat = 10
    var gap:CGFloat = 2
    var fillcolor: UIColor = .orange
    var unfillcolor: UIColor = UIColor.lightGray
    
    var star1 : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "star.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.lightGray
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    var star2 : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "star.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.lightGray
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    var star3 : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "star.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.lightGray
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    var star4 : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "star.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.lightGray
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    var star5 : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "star.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.lightGray
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    
    convenience init(sizex: CGFloat,gapx:CGFloat) {
              self.init(frame: CGRect.zero)
            size = sizex
            gap = gapx
            setupView()
            setupConstraints()
              //assign custom vars
          }


    override init(frame: CGRect) {
        
            super.init(frame: frame)
           
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
            setupConstraints()
            fatalError("init(coder:) has not been implemented")
        }
        

    func setupView() {
        
        
        addSubview(star1)
        addSubview(star2)
        addSubview(star3)
        addSubview(star4)
        addSubview(star5)
        
        
    }
    
    
    func setupConstraints() {
        
        star1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        star1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        star1.widthAnchor.constraint(equalToConstant: size).isActive = true
        star1.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        star2.leftAnchor.constraint(equalTo: star1.rightAnchor, constant: gap).isActive = true
        star2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        star2.widthAnchor.constraint(equalToConstant: size).isActive = true
        star2.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        star3.leftAnchor.constraint(equalTo: star2.rightAnchor, constant: gap).isActive = true
        star3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        star3.widthAnchor.constraint(equalToConstant: size).isActive = true
        star3.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        star4.leftAnchor.constraint(equalTo: star3.rightAnchor, constant: gap).isActive = true
        star4.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        star4.widthAnchor.constraint(equalToConstant: size).isActive = true
        star4.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        star5.leftAnchor.constraint(equalTo: star4.rightAnchor, constant: gap).isActive = true
        star5.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        star5.widthAnchor.constraint(equalToConstant: size).isActive = true
        star5.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        
    }
    
    
    func setRating(ratingUnit:Int) {
        
        if (ratingUnit == 1){
            star1.tintColor = fillcolor
            
        }
        if (ratingUnit == 2){
            star1.tintColor = fillcolor
            star2.tintColor = fillcolor
            
        }
        if (ratingUnit == 3){
            star1.tintColor = fillcolor
            star2.tintColor = fillcolor
            star3.tintColor = fillcolor
            
        }
        if (ratingUnit == 4){
            star1.tintColor = fillcolor
            star2.tintColor = fillcolor
            star3.tintColor = fillcolor
            star4.tintColor = fillcolor
        
            
        }
        if (ratingUnit == 5){
            star1.tintColor = fillcolor
            star2.tintColor = fillcolor
            star3.tintColor = fillcolor
            star4.tintColor = fillcolor
            star5.tintColor = fillcolor
            
        }
        
        
        
    }
    
    
    

}
