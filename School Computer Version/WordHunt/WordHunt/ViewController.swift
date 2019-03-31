//
//  ViewController.swift
//  WordHunt
//
//  Created by Tech on 2019-03-14.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var db: OpaquePointer?
    var players = [Player]()
    
    
    @IBOutlet weak var instructions: UILabel!
    
    @IBAction func iShow(_ sender: UIButton) {
        if self.instructions.isHidden == true{
            self.instructions.isHidden = false
        }
        else if self.instructions.isHidden == false{
            self.instructions.isHidden = true
        }
    }
    
    @IBOutlet weak var oneTimer: UILabel!
    @IBOutlet weak var twoTimer: UILabel!
    @IBOutlet weak var threeTimer: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
//    var users: [String] = ["Hao", "Tam", "Quan", "Chris"]
//    var scores: [String] = ["5:00", "6:00", "7:00", "8:00"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (players.count);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = players[indexPath.row].name + "   -   " + String(players[indexPath.row].score)
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        oneTimer.text = "One"
//        twoTimer.text = "Two"
//        threeTimer.text = "Three"
        
        let file = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("database.db")
        if sqlite3_open(file.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            let create = "CREATE TABLE IF NOT EXISTS Players(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score INTEGER)"
            if sqlite3_exec(db, create, nil, nil, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(db))
                print("error creating db: \(err)")
            }
        }
        readPlayerValues()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        readPlayerValues()
    }
    
    // Read player values from database
    func readPlayerValues() {
        players.removeAll()
        let p1 = Player(id: 100, name: "Hao", score: 200)
        let p2 = Player(id: 101, name: "Tam", score: 300)
        let p3 = Player(id: 102, name: "Quan", score: 400)
        let p4 = Player(id: 103, name: "Chris", score: 500)
        players.append(contentsOf: [p1, p2, p3, p4])
        let q = "SELECT * FROM Players"
        var stmt: OpaquePointer?
        if sqlite3_prepare(db, q, -1, &stmt, nil) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("error preparing statment: \(err)")
            return
        }
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = Int(sqlite3_column_int(stmt, 0))
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let score = Int(sqlite3_column_int(stmt, 2))
            let p = Player(id: id, name: name, score: score)
            players.append(p)
        }
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

