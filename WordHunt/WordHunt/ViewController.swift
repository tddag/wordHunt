//
//  ViewController.swift
//  WordHunt
//
//  Created by Tech on 2019-03-14.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var instructions: UILabel!
    
    @IBAction func iShow(_ sender: UIButton) {
        if self.instructions.isHidden == true{
            self.instructions.isHidden = false
        }
        else if self.instructions.isHidden == false{
            self.instructions.isHidden = true
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    var users: [String] = ["Hao", "Tam", "Quan", "Chris", "Player", "Test"]
    var scores: [String] = ["4:00", "4:12", "4:56", "5:15", "7:27", "10:00"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (users.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = users[indexPath.row] + "   -   " + scores[indexPath.row]
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

