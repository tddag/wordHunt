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
            let countCheck = "SELECT COUNT (*) FROM Players"
            var stmt: OpaquePointer?
            var count = 0
            if sqlite3_prepare(self.db, countCheck, -1, &stmt, nil) == SQLITE_OK{
                while(sqlite3_step(stmt) == SQLITE_ROW){
                    count = Int(sqlite3_column_int(stmt, 0))
                }
                
            }

            if count < 4 {
                let initialScores = [["Hao", 200],["Tam",300],["Quan",400],["Chris",500]]
                for score in initialScores{
                    let name:String = score[0] as! String
                    let scr:Int = score[1] as! Int
                    let insert = "INSERT INTO Players(name, score) VALUES(?, ?)"
                    var stmt: OpaquePointer?
                    
                    if sqlite3_prepare(db, insert, -1, &stmt, nil) != SQLITE_OK {
                        let err = String(cString: sqlite3_errmsg(db))
                        print("error preparing statment: \(err)")
                        return
                    }
                    if sqlite3_bind_text(stmt, 1, name, -1, nil) != SQLITE_OK {
                        let err = String(cString: sqlite3_errmsg(db))
                        print("error binding name: \(err)")
                        return
                    }
                    if sqlite3_bind_int(stmt, 2, Int32(scr)) != SQLITE_OK {
                        let err = String(cString: sqlite3_errmsg(db))
                        print("error binding score: \(err)")
                        return
                    }
                    
                    if sqlite3_step(stmt) != SQLITE_DONE {
                        let err = String(cString: sqlite3_errmsg(db))
                        print("error executing insert: \(err)")
                        return        }
                }
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
        let q = "SELECT * FROM Players ORDER BY score"
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

