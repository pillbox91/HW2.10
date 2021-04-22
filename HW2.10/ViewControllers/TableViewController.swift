//
//  TableViewController.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var rickAndMorty: [RickAndMorty] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCourses()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchCourses()
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
    
}

// MARK: - Networking
extension TableViewController {
    func fetchCourses() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            
            do {
                let website = try jsonDecoder.decode(WebsiteDescription.self, from: data)
                self.rickAndMorty = website.results ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
