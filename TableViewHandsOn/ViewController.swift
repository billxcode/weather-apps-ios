//
//  ViewController.swift
//  TableViewHandsOn
//
//  Created by Bill Tanthowi Jauhari on 04/07/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit


struct Wheater: Decodable {
    let current: Current
    let location: Location
}

struct Current: Decodable {
    let cloud: Float
    let feelslike_c: Float
    let feelslike_f: Float
}

struct Location: Decodable {
    let country: String
    let region: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Table IBOutlets
    @IBOutlet weak var contactTableView: UITableView!
    
    let nameArray = [
        "Jason", "Dea", "Edvyn"
    ]
    
    let numberArray = [
        12345, 123456, 123455
    ]
    
    var contact = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataKita = URL(string: "https://api.apixu.com/v1/current.json?key=f034976db32e4cf39e983419190407&q=Tangerang")!
        
        let task = URLSession.shared.dataTask(with:  dataKita) { (dataIni, response, error) in
            
            if error == nil {
                do {
                    let jsonData = try JSONDecoder().decode(Wheater.self, from: dataIni!)
                    print(jsonData.current.cloud)
                    print(jsonData.current.feelslike_c)
                    print(jsonData.current.feelslike_f)
                } catch let Error {
                    print("error", Error)
                }
            }
            
        }
        
        task.resume()
        
        
        for i in 0..<nameArray.count {
            let data = Contact(name: nameArray[i], number: numberArray[i])
            contact.append(data)
        }
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourData = tableView.dequeueReusableCell(withIdentifier: "halloCell") as? ContactTableViewCell
        
        ourData?.name.text = contact[indexPath.row].name
        ourData?.number.text = "\(contact[indexPath.row].number)"
        
        return ourData!
        
    }
}

