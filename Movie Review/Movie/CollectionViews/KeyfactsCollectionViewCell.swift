//
//  KeyfactsCollectionViewCell.swift
//  Movie Review
//
//  Created by Globeways Technologies on 14/01/23.
//

import UIKit

class KeyfactsCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Bold", size: 12.0)!
            return uilabel
        }()
    
    
    var valueLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.backgroundColor = .clear
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.textColor = .darkGray
        uilabel.textAlignment = .left
        uilabel.font = UIFont(name: "SFProText-Regular", size: 16.0)!
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
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor ,constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        
        
        self.addSubview(valueLabel)
        valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor ,constant: 4).isActive = true
        valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
       
        
        
        
    }
    
    
    
}
