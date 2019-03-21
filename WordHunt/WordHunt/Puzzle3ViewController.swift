//
//  Puzzle3ViewController.swift
//  WordHunt
//
//  Created by Tam Dang on 2019-03-21.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit

class Puzzle3ViewController: UIViewController {

    
    var level1Outcome: String?
    var level2Outcome: String?
    
    @IBOutlet weak var timerLbl: UILabel!
    
    @IBOutlet weak var level1OutcomeLbl: UILabel!
    
    @IBOutlet weak var level2OutcomeLbl: UILabel!
    var isTimerOn = false
    
    var duration = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isTimerOn.toggle()
        toggleTimer(on: isTimerOn)

        if let lv1 = level1Outcome {
            level1OutcomeLbl.text = lv1
        }
        if let lv2 = level2Outcome {
            level2OutcomeLbl.text = lv2
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
