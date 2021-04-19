//
//  ViewController.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 18.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var buttonCH: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! TableViewController
        VC.fetchCourses()
    }
    

}
