//
//  FriendCell.swift
//  vkontakteApp
//
//  Created by Иван on 11/27/21.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    var friend: Friend? {
        didSet {
            
            guard let image = friend?.image else { return }
            friendImage.image = UIImage(named: image)
        }
    }

    
    private let friendImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
                
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 1, green: 0.09326624756, blue: 0.0197128029, alpha: 1)
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendCell {
    func addSubviews() {
        addSubview(friendImage)
    }
    
    func layout() {
        
        friendImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        friendImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        friendImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        friendImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
    }

}
