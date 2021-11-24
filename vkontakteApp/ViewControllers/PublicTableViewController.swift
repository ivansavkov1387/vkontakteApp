//
//  PublicTableViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/24/21.
//

import UIKit

class PublicTableViewController: UITableViewController {
    
    private let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
    
}
    
    extension PublicTableViewController {
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        
        
    }
