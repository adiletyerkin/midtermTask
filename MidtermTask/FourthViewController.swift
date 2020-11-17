//
//  FourthViewController.swift
//  MidtermTask
//
//  Created by Macbook Pro 2020 on 10/16/20.
//  Copyright © 2020 Macbook Pro 2020. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charac.count
    }
    
    var names = ["Jon Snow", "Sansa Stark", "Eddard", "Jaime Lannister", "Tyrion Lannister", "Cersei Lannister", "Joffrey Baratheon", "Aerys II Targaryen",
    "Daenerys Targaryen", "Tywin Lannister", "Ramsay Bolton", "Arya Stark", "Robert Baratheon", "Theon Greyjoy", "Samwell Tarly", "Lord Varys", "Bran Stark", "Brienne of Tharth", "Petyr Baelish", "Tormund", "Melisandre", "Olenna Tyrell", "Mance Rayder"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
        
        cell.characterName.text = charac[indexPath.row].name
        cell.characterSlug.text = charac[indexPath.row].slug
        
        cell.charcterImage.image = UIImage(named: names[indexPath.row])
        
    
            return cell
    
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    
    var charac = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCharacters()
        self.charactersTable.delegate = self
        self.charactersTable.dataSource = self
        self.charactersTable.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    
    @IBOutlet weak var charactersTable: UITableView!

    func getCharacters(){
               let urlString = "https://game-of-thrones-quotes.herokuapp.com/v1/characters"

               guard let url = URL(string: urlString) else
               {
                   print("URL in not valid")
                   return
               }
               URLSession.shared.dataTask(with: url){ (data, response, error) in
                   guard let data = data else {
                       print("error: \(error!)")
                       return
                   }
               do{
                   let charac = try JSONDecoder().decode([Character].self, from: data)
                for i in charac{
                    print(i.name," ", i.slug)
                }
                self.charac.append(contentsOf: charac)


               }
               catch let jsonErr{
                   print("Error in json", jsonErr)
                   }

                DispatchQueue.main.async {
                    self.charactersTable.reloadData()
                }
               }.resume()

       }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AdditionalInfoViewController") as? AdditionalInfoViewController
        vc?.charName = charac[indexPath.row].name
        vc?.charSlug = charac[indexPath.row].slug
        vc?.charImage = UIImage(named: names[indexPath.row])!
    
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    
}

