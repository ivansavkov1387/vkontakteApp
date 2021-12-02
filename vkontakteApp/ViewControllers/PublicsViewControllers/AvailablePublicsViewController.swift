//
//  PublicTableViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/24/21.
//

import UIKit

protocol AvailablePublicsViewControllerDelegate: class {
    func getPublic(onePublic: Public)
}

class AvailablePublicsViewController: UITableViewController {
    
    private let cellID = "cell"
    
    weak var delegate: AvailablePublicsViewControllerDelegate?
    
    private var availablePublics = [
                            Public(name: "Автоподбор РоговМобиль", image: "rogov"),
                            Public(name: "MRZLK", image: "mrzlk"),
                            Public(name: "ВГМУ | Официальная страница", image: "vsmu"),
                            Public(name: "ЯСМП †", image: "ysmp"),
                            Public(name: "NR.Music", image: "nr")
                            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PublicsCell.self, forCellReuseIdentifier: cellID)
        
    }
    
}
    
    extension AvailablePublicsViewController {
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PublicsCell
            cell.onePublic = availablePublics[indexPath.row]
            return cell
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return availablePublics.count
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let pickedPublic = availablePublics.remove(at: indexPath.row)
            delegate?.getPublic(onePublic: pickedPublic)
            tableView.reloadData()
           
        }
        
        
    }
