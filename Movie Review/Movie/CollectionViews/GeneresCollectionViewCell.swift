//
//  GeneresCollectionViewCell.swift
//  Movie Review
//
//  Created by Globeways Technologies on 14/01/23.
//

import UIKit

class GeneresCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .black
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Regular", size: 14.0)!
            return uilabel
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
        
        
        
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor ,constant: 4).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 9).isActive = true
        
        
        
    }
    
    
}
