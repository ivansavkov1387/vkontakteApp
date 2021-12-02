//
//  PublicsCell.swift
//  vkontakteApp
//
//  Created by Иван on 11/29/21.
//

import UIKit

class PublicsCell: UITableViewCell {
    
    var onePublic: Public? {
        didSet {
            publicName.text = onePublic?.name
            
            guard let image = onePublic?.image else { return }
            publicImage.image = UIImage(named: image)
            
        }
    }
    
    private let publicName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    private let publicImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
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

extension PublicsCell {
    
    private func addSubviews() {
        contentView.addSubview(publicName)
        contentView.addSubview(publicImage)
    }
    
    private func layout() {
        
        publicImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        publicImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        publicImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        publicImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        publicImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        publicImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        
        publicName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        publicName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        publicName.leadingAnchor.constraint(equalTo: publicImage.trailingAnchor, constant: 12).isActive = true
        publicName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        publicName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }

}
