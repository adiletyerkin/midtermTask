//
//  ThirdViewController.swift
//  MidtermTask
//
//  Created by Macbook Pro 2020 on 10/16/20.
//  Copyright © 2020 Macbook Pro 2020. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getHouses()
        self.booksTable.delegate = self
        self.booksTable.dataSource = self
        self.booksTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }
    var houses = [House]()
    var members = [Member]()
    var houseImages = ["stark", "lannister", "baratheon", "targaryen", "greyjoy", "tarly", "tarth", "bolton", "baelish", "tyrell"]
  
    @IBOutlet weak var booksTable: UITableView!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.houses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.houseName.text = houses[indexPath.row].name
        cell.houseSlug.text = houses[indexPath.row].slug
        cell.houseImage.image = UIImage(named: houseImages[indexPath.row])

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    
    func getHouses(){

        let urlString = "https://game-of-thrones-quotes.herokuapp.com/v1/houses"

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
            let houses = try JSONDecoder().decode([House].self, from: data)
            for i in houses{
                print(i.name! , i.slug!)
            }

            self.houses.append(contentsOf: houses)

        }
        catch let jsonErr{
            print("Error in json", jsonErr)

            }
            DispatchQueue.main.async {
                self.booksTable.reloadData()
            }
        }.resume()

    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
//    func getMembers(){
//
//                let urlString = "https://game-of-thrones-quotes.herokuapp.com/v1/houses"
//                guard let url = URL(string: urlString) else{
//                        print("URL in not valid")
//                        return
//                    }
//                    let session = URLSession.shared
//                    let request = URLRequest(url: url)
//
//                    let task = session.dataTask(with: request){
//                        (data, response, error) in
//                        guard error == nil else{
//                            print("error: \(error!)")
//                            return
//                        }
//
//                        guard let responseData = data else{
//                            print("did not recieve data")
//                            return
//                        }
//
//                    do{
//                            guard let data = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any] else{
//                                print("error trying convert json to data")
//                                return
//                            }
//                            let decoder = JSONDecoder()
//                            let myarray = data["members"] as? [[String: Any]] ?? [[String: Any]]()
//                            let json = try JSONSerialization.data(withJSONObject: myarray)
//                            decoder.keyDecodingStrategy = .convertFromSnakeCase
//                            let decoded = try decoder.decode([Member].self, from: json)
//
////                            print(decoded)
//
//                            for i in decoded{
//                                print(i.name!)
//                            }
//                            self.members.append(contentsOf: decoded)
//
//
//                            }
//
//                        catch{
//                            print(error)
//
//                        }
//                        DispatchQueue.main.async {
//                            self.booksTable.reloadData()
//                        }
//
//
//                    }
//                    task.resume()
//
//
//                }
        
    }




