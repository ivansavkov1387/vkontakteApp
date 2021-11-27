//
//  FriendsViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/23/21.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    let cellID = "cell"
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFriendsArray()
        tableView.register(FriendsCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    private func createFriendsArray() {
        friends.append(Friend(name: "Bob", image: "friend1"))
        friends.append(Friend(name: "Helen", image: "friend2"))
    }
    
        
}

extension FriendsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FriendsCell
        cell.friend = friends[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let friendVC = FriendViewController(collectionViewLayout: UICollectionViewFlowLayout())
        friendVC.friend = friends[indexPath.row]
        navigationController?.pushViewController(friendVC, animated: true)
    }
    

}


