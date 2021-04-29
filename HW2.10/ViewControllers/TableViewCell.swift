//
//  TableViewCell.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var imageViewCell: UIImageView! {
        didSet {
            imageViewCell.contentMode = .scaleAspectFit
            imageViewCell.clipsToBounds = true
            imageViewCell.layer.cornerRadius = imageViewCell.bounds.height / 2
            imageViewCell.backgroundColor = .white
        }
    }
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with rick: RickAndMorty) {
        nameLabel.text = rick.name
        
        DispatchQueue.global().async {
            guard let stringURL = rick.image else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.imageViewCell.image = UIImage(data: imageData)
            }
        }
    }
}
