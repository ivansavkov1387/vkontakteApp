//
//  PublicsViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/23/21.
//

import UIKit


class PublicsViewController: UITableViewController {
    
    private let cellID = "cell"
    private var publics = [Public]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PublicsCell.self, forCellReuseIdentifier: cellID)
        customNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func customNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPublic))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addPublic() {
        let availablePublicsVC = AvailablePublicsViewController()
        availablePublicsVC.delegate = self
        
        navigationController?.pushViewController(availablePublicsVC, animated: true)
    }
    
}

extension PublicsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PublicsCell
        cell.onePublic = publics[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            publics.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

extension PublicsViewController: AvailablePublicsViewControllerDelegate {
    internal func getPublic(onePublic: Public) {
        if !publics.contains(onePublic) {
            publics.append(onePublic)
        }
    }
}
