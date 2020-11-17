//
//  WelcomeViewController.swift
//  MidtermTask
//
//  Created by Macbook Pro 2020 on 10/18/20.
//  Copyright © 2020 Macbook Pro 2020. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        nameUserLab.text = nameUser

        
    }
    
    @IBOutlet weak var nameUserLab: UILabel!
    
    var nameUser : String?
   
        
}
