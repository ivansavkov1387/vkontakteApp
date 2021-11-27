//
//  FriendsCell.swift
//  vkontakteApp
//
//  Created by Иван on 11/27/21.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    var friend: Friend? {
        didSet {
            friendName.text = friend?.name
            
            guard let image = friend?.image else { return }
            friendImage.image = UIImage(named: image)
        }
    }
    
    private let friendName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    private let friendImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendsCell {
    
    func addSubviews() {
        contentView.addSubview(friendName)
        contentView.addSubview(friendImage)
    }
    
    func layout() {
        
        friendImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        friendImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        friendImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        friendImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        friendImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        friendImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        
        friendName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        friendName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        friendName.leadingAnchor.constraint(equalTo: friendImage.trailingAnchor, constant: 12).isActive = true
        friendName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        friendName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
}
