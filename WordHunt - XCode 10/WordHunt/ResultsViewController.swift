//
//  ResultsViewController.swift
//  WordHunt
//
//  Created by Tam Dang on 2019-03-21.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var level1Outcome: String?
    var level2Outcome: String?
    var level3Outcome: String?
    var total:Int = 0
    
    @IBOutlet weak var lv1Lbl: UILabel!
    
    @IBOutlet weak var lv2Lbl: UILabel!
    
    @IBOutlet weak var lv3Lbl: UILabel!
    
    @IBOutlet weak var totalTimeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
