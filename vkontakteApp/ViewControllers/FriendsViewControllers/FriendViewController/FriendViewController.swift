//
//  FriendViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/23/21.
//

import UIKit

class FriendViewController: UICollectionViewController {
    
    private let reuseIdentifier = "Cell"
    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FriendCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
}

extension FriendViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCell
        cell.friend = friend
        return cell
    }
    
}
