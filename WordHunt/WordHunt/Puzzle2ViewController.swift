//
//  Puzzle2ViewController.swift
//  WordHunt
//
//  Created by Tam Dang on 2019-03-21.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit

class Puzzle2ViewController: UIViewController {

    var level1Outcome: String?
    
    @IBOutlet weak var Outcome1Lbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    var isTimerOn = false
    
    var duration = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isTimerOn.toggle()
        toggleTimer(on: isTimerOn)
        
        if let lv1 = level1Outcome {
            Outcome1Lbl.text = lv1
        }

        // Do any additional setup after loading the view.
    }
    
    func toggleTimer(on: Bool) {
        if on {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.duration += 1
                strongSelf.timerLbl.text = String(strongSelf.duration)
                }
            )
        } else {
            timer.invalidate()
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "level3Show" {
            let dc = segue.destination as! Puzzle3ViewController
            if let lv1 = level1Outcome {
                dc.level1Outcome = lv1
            }
            dc.level2Outcome = String(duration)
        }
    }
    

}
