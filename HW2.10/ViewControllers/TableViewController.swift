//
//  TableViewController.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var rickAndMorty: [RickAndMorty] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let course = rickAndMorty[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
    
}

// MARK: - Networking
extension TableViewController {
    func fetchCourses() {
        guard let url = URL(string: "rickandmortyapi.com/api/character/18") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            
            do {
                self.rickAndMorty = try jsonDecoder.decode([RickAndMorty].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
