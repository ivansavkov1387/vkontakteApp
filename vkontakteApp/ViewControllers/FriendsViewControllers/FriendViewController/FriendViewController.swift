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

extension FriendViewController: UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    }
    
}
