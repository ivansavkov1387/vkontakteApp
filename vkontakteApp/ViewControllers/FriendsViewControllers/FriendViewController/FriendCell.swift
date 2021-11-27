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
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        friendImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        friendImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        friendImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        friendImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }

}
