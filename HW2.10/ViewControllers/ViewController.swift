//
//  ViewController.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 27.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var text: UILabel?
    var image: UIImage?
    var gender: String?
    var species: String?
    var status: String?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = text?.text
        setup()
    }
    
    private func setup() {
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        
        imageView.image = image
        nameLabel.text = "My name is \(text?.text ?? "unknown")"
        genderLabel.text = "Gender - \(gender ?? "unknown")"
        speciesLabel.text = "Species - \(species ?? "unknown")"
        statusLabel.text = "Status - \(status ?? "unknown")"
    }
}
