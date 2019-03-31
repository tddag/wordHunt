//
//  ResultsViewController.swift
//  WordHunt
//
//  Created by Tam Dang on 2019-03-21.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit
import SQLite3

class ResultsViewController: UIViewController {
    
    var level1Outcome: String?
    var level2Outcome: String?
    var level3Outcome: String?
    var total:Int = 0
    var db: OpaquePointer?
    
    @IBOutlet weak var lv1Lbl: UILabel!
    
    @IBOutlet weak var lv2Lbl: UILabel!
    
    @IBOutlet weak var lv3Lbl: UILabel!
    
    @IBOutlet weak var totalTimeLbl: UILabel!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let file = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("database.db")
        print(file)
        if sqlite3_open(file.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            let create = "CREATE TABLE IF NOT EXISTS Players(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score INTEGER)"
            if sqlite3_exec(db, create, nil, nil, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(db))
                print("error creating db: \(err)")
            }
        }
        
        if let lv1 = level1Outcome {
            lv1Lbl.text = "Level 1: \(lv1)"
            total += Int(lv1)!
        }
        if let lv2 = level2Outcome {
            lv2Lbl.text = "Level 2: \(lv2)"
            total += Int(lv2)!
        }
        if let lv3 = level3Outcome {
            lv3Lbl.text = "Level 3: \(lv3)"
            total += Int(lv3)!
        }
        totalTimeLbl.text = "Total Time: \(total)"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitScore(_ sender: Any) {
        
        var name = nameTxt.text!
        if name == "" {
            name = "Anonymous"
        }
        let score = total
        
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
        if sqlite3_bind_int(stmt, 2, Int32(score)) != SQLITE_OK {
            let err = String(cString: sqlite3_errmsg(db))
            print("error binding score: \(err)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let err = String(cString: sqlite3_errmsg(db))
            print("error executing insert: \(err)")
            return        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
