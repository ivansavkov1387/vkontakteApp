//
//  FriendsViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/23/21.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    let cellID = "cell"
    let items = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
        
}

extension FriendsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendVC = FriendViewController(collectionViewLayout: UICollectionViewLayout())
        navigationController?.pushViewController(friendVC, animated: true)
    }
}


