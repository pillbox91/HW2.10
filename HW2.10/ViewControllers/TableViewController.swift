//
//  TableViewController.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    private var rickAndMorty: [RickAndMorty] = []
    private let url = "https://rickandmortyapi.com/api/character"
    private let url2 = "https://rickandmortyapi.com/api/character?page=2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 75
        NetworkManager.shared.getResponse(from: url) {rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let course = rickAndMorty[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailsVC = segue.destination as? ViewController else { return }
        
        detailsVC.person = rickAndMorty[indexPath.row]
    }
    
}

