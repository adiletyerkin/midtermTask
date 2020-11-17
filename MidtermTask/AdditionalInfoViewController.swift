//
//  AdditionalInfoViewController.swift
//  MidtermTask
//
//  Created by Macbook Pro 2020 on 10/18/20.
//  Copyright © 2020 Macbook Pro 2020. All rights reserved.
//

import UIKit

class AdditionalInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        characterName.text = charName
        characterSlug.text = charSlug
        charcterImage.image = charImage
        print(charName)
    }
    
    
    @IBOutlet weak var characterName: UILabel!
    
    @IBOutlet weak var charcterImage: UIImageView!
    
    @IBOutlet weak var characterSlug: UILabel!
    
    var charImage = UIImage()
    var charName = ""
    var charSlug = ""


}
