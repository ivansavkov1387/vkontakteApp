//
//  PublicsViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/23/21.
//

import UIKit

class PublicsViewController: UITableViewController {
    
    let cellID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
}

extension PublicsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        return cell
    }
    
}
