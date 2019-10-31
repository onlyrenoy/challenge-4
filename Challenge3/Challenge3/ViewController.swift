//
//  ViewController.swift
//  Challenge3
//
//  Created by Renoy Chowdhury on 31/10/2019.
//  Copyright © 2019 Renoy Chowdhury. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var listOfItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearItems))
    }
    
    @objc
    func addItem() {
        presentAlert()
    }
    
    func presentAlert() {

        let alertController = UIAlertController(title: "Add Item to list", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        alertController.addAction(UIAlertAction(title: "Insert Item to Add", style: .default, handler: { (action) in
            let answer = alertController.textFields?.first?.text
            self.listOfItems.append(answer ?? "")
            self.tableView.reloadData()
        }))
        
        present(alertController, animated: true)
    }
    
    @objc
    func clearItems(){
        listOfItems.removeAll()
        tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = listOfItems[indexPath.row]
        
        return cell
    }
}

