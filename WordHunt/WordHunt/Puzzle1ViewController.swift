//
//  Puzzle1ViewController.swift
//  WordHunt
//
//  Created by Tam Dang on 2019-03-21.
//  Copyright © 2019 Tech. All rights reserved.
//

import UIKit

class Puzzle1ViewController: UIViewController {
    
    
    @IBOutlet weak var timerlbl: UILabel!
    
    var isTimerOn = false
    
    var duration = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isTimerOn.toggle()
        toggleTimer(on: isTimerOn)
        // Do any additional setup after loading the view.
    }
    
    func toggleTimer(on: Bool) {
        if on {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.duration += 1
                strongSelf.timerlbl.text = String(strongSelf.duration)
                }
                )
        } else {
            timer.invalidate()
        }
    }
    
    
    @IBAction func checkBtn(_ sender: Any) {
        timer.invalidate()
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "level2Show" {
            let dc = segue.destination as! Puzzle2ViewController
            dc.level1Outcome = String(duration)
        }
    }
    

}
