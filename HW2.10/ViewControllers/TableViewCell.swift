//
//  TableViewCell.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with rick: RickAndMorty) {
        nameLabel.text = rick.name
        
        DispatchQueue.global().async {
            guard let stringURL = rick.imageURL else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
}
