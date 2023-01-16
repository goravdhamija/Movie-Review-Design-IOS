//
//  MoviesTableViewCell.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import UIKit
import Foundation


class MoviesTableViewCell: UITableViewCell {
    
    
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
    
    var movieDetailedView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .clear
        uiview.translatesAutoresizingMaskIntoConstraints = false
            return uiview
        }()
    
    
    var movieYearLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Regular", size: 12.0)!
            return uilabel
        }()
    
    
    var movieNameLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .black
        uilabel.textAlignment = .left
        
        uilabel.numberOfLines = 0
        uilabel.lineBreakMode = .byWordWrapping
        uilabel.sizeToFit()
        uilabel.clipsToBounds = true
        
        uilabel.font = UIFont(name: "SFProText-Bold", size: 16.0)!
            return uilabel
        }()
    
    
    var bookmarkUnfill : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "bookmark", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.black
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    var bookmarkFilled : UIImageView = {
        let boldConfigyse3 = UIImage.SymbolConfiguration(weight: .regular)
        let playButtonImage = UIImage(systemName: "bookmark.fill", withConfiguration: boldConfigyse3)
        let playButtonImageView:UIImageView = UIImageView()
        playButtonImageView.image = playButtonImage
        playButtonImageView.tintColor = UIColor.orange
        playButtonImageView.backgroundColor = .clear
        playButtonImageView.clipsToBounds = true
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    
    var ratingView : RatingStarView = {
        
        let playButtonImageView:RatingStarView = RatingStarView(sizex: 10, gapx: 2)
        playButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        return playButtonImageView
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
           

           addViews()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func addViews(){
        
        
        
        
        self.contentView.addSubview(moviePosterShadowView)
        moviePosterShadowView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 30).isActive = true
        moviePosterShadowView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        moviePosterShadowView.heightAnchor.constraint(equalToConstant: 89).isActive = true
        moviePosterShadowView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        moviePosterShadowView.backgroundColor = .green
        moviePosterShadowView.layer.shadowOpacity = 0.2
        moviePosterShadowView.layer.shadowOffset = .zero
        moviePosterShadowView.layer.shadowRadius = 10
        moviePosterShadowView.layer.cornerRadius = 10
      
        
        moviePosterShadowView.addSubview(movieImageView1)
        movieImageView1.centerXAnchor.constraint(equalTo: moviePosterShadowView.centerXAnchor).isActive = true
        movieImageView1.centerYAnchor.constraint(equalTo: moviePosterShadowView.centerYAnchor).isActive = true
        movieImageView1.heightAnchor.constraint(equalToConstant: 89).isActive = true
        movieImageView1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        movieImageView1.backgroundColor = .green
        movieImageView1.layer.cornerRadius = 10
        movieImageView1.layer.masksToBounds = true
        movieImageView1.clipsToBounds = true
        
        self.contentView.addSubview(movieDetailedView)
        movieDetailedView.leftAnchor.constraint(equalTo: moviePosterShadowView.rightAnchor, constant: 26).isActive = true
        movieDetailedView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        movieDetailedView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        movieDetailedView.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
        movieDetailedView.addSubview(movieYearLabel)
        movieYearLabel.leftAnchor.constraint(equalTo: movieDetailedView.leftAnchor).isActive = true
        movieYearLabel.topAnchor.constraint(equalTo: movieDetailedView.topAnchor).isActive = true
        movieYearLabel.text = "2008"
        
        movieDetailedView.addSubview(movieNameLabel)
        movieNameLabel.leftAnchor.constraint(equalTo: movieDetailedView.leftAnchor).isActive = true
        movieNameLabel.topAnchor.constraint(equalTo: movieYearLabel.bottomAnchor).isActive = true
        movieNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        movieNameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 60).isActive = true
        movieNameLabel.text = "The Dark Knight"
        
        movieDetailedView.addSubview(ratingView)
        ratingView.leftAnchor.constraint(equalTo: movieDetailedView.leftAnchor).isActive = true
        ratingView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ratingView.setRating(ratingUnit: 3)
      //  ratingView.backgroundColor = .orange
        
        self.contentView.addSubview(bookmarkUnfill)
        bookmarkUnfill.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -30).isActive = true
        bookmarkUnfill.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: -10).isActive = true
        bookmarkUnfill.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        bookmarkUnfill.heightAnchor.constraint(equalToConstant: 25 ).isActive = true
        
        self.contentView.addSubview(bookmarkFilled)
        bookmarkFilled.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -30).isActive = true
        bookmarkFilled.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor , constant: -10).isActive = true
        bookmarkFilled.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        bookmarkFilled.heightAnchor.constraint(equalToConstant: 25 ).isActive = true
        bookmarkFilled.isHidden = true
        
        
        
    
        
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        movieImageView1.removeFromSuperview()
//        movieDetailedView.removeFromSuperview()
//        movieYearLabel.removeFromSuperview()
//        movieNameLabel.removeFromSuperview()
//        bookmarkFilled.removeFromSuperview()
//        bookmarkUnfill.removeFromSuperview()
      //  bookmarkFilled.isHidden = true
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
