//
//  ViewController.swift
//  MidtermTask
//
//  Created by Macbook Pro 2020 on 10/14/20.
//  Copyright © 2020 Macbook Pro 2020. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "inputDataName"){
                let displayVC = segue.destination as! WelcomeViewController
                displayVC.nameUser = emailField.text
        }
    }

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    @IBAction func logInBotton(_ sender: UIButton) {
            self.performSegue(withIdentifier: "inputDataName", sender: self)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{return}
      
        let parameters = [
            "name" : emailField.text ?? "",
            "password" : passwordField.text ?? ""
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[]) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
//            if let response = response{
//                print(response)
//            }
            guard let data = data else{return}
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch{
                print(error)
            }
        }.resume()

    }
    
}

