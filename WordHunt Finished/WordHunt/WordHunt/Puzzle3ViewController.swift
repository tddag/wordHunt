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
    
    // Button Outlets
    // Row 0
    @IBOutlet weak var A00: UIButton!
    @IBOutlet weak var A01: UIButton!
    @IBOutlet weak var A02: UIButton!
    @IBOutlet weak var A03: UIButton!
    @IBOutlet weak var A04: UIButton!
    @IBOutlet weak var A05: UIButton!
    @IBOutlet weak var A06: UIButton!
    @IBOutlet weak var A07: UIButton!
    @IBOutlet weak var A08: UIButton!
    @IBOutlet weak var A09: UIButton!
    // Row 1
    @IBOutlet weak var A10: UIButton!
    @IBOutlet weak var A11: UIButton!
    @IBOutlet weak var A12: UIButton!
    @IBOutlet weak var A13: UIButton!
    @IBOutlet weak var A14: UIButton!
    @IBOutlet weak var A15: UIButton!
    @IBOutlet weak var A16: UIButton!
    @IBOutlet weak var A17: UIButton!
    @IBOutlet weak var A18: UIButton!
    @IBOutlet weak var A19: UIButton!
    // Row 2
    @IBOutlet weak var A20: UIButton!
    @IBOutlet weak var A21: UIButton!
    @IBOutlet weak var A22: UIButton!
    @IBOutlet weak var A23: UIButton!
    @IBOutlet weak var A24: UIButton!
    @IBOutlet weak var A25: UIButton!
    @IBOutlet weak var A26: UIButton!
    @IBOutlet weak var A27: UIButton!
    @IBOutlet weak var A28: UIButton!
    @IBOutlet weak var A29: UIButton!
    // Row 3
    @IBOutlet weak var A30: UIButton!
    @IBOutlet weak var A31: UIButton!
    @IBOutlet weak var A32: UIButton!
    @IBOutlet weak var A33: UIButton!
    @IBOutlet weak var A34: UIButton!
    @IBOutlet weak var A35: UIButton!
    @IBOutlet weak var A36: UIButton!
    @IBOutlet weak var A37: UIButton!
    @IBOutlet weak var A38: UIButton!
    @IBOutlet weak var A39: UIButton!
    // Row 4
    @IBOutlet weak var A40: UIButton!
    @IBOutlet weak var A41: UIButton!
    @IBOutlet weak var A42: UIButton!
    @IBOutlet weak var A43: UIButton!
    @IBOutlet weak var A44: UIButton!
    @IBOutlet weak var A45: UIButton!
    @IBOutlet weak var A46: UIButton!
    @IBOutlet weak var A47: UIButton!
    @IBOutlet weak var A48: UIButton!
    @IBOutlet weak var A49: UIButton!
    // Row 5
    @IBOutlet weak var A50: UIButton!
    @IBOutlet weak var A51: UIButton!
    @IBOutlet weak var A52: UIButton!
    @IBOutlet weak var A53: UIButton!
    @IBOutlet weak var A54: UIButton!
    @IBOutlet weak var A55: UIButton!
    @IBOutlet weak var A56: UIButton!
    @IBOutlet weak var A57: UIButton!
    @IBOutlet weak var A58: UIButton!
    @IBOutlet weak var A59: UIButton!
    // Row 6
    @IBOutlet weak var A60: UIButton!
    @IBOutlet weak var A61: UIButton!
    @IBOutlet weak var A62: UIButton!
    @IBOutlet weak var A63: UIButton!
    @IBOutlet weak var A64: UIButton!
    @IBOutlet weak var A65: UIButton!
    @IBOutlet weak var A66: UIButton!
    @IBOutlet weak var A67: UIButton!
    @IBOutlet weak var A68: UIButton!
    @IBOutlet weak var A69: UIButton!
    // Row 7
    @IBOutlet weak var A70: UIButton!
    @IBOutlet weak var A71: UIButton!
    @IBOutlet weak var A72: UIButton!
    @IBOutlet weak var A73: UIButton!
    @IBOutlet weak var A74: UIButton!
    @IBOutlet weak var A75: UIButton!
    @IBOutlet weak var A76: UIButton!
    @IBOutlet weak var A77: UIButton!
    @IBOutlet weak var A78: UIButton!
    @IBOutlet weak var A79: UIButton!
    // Row 8
    @IBOutlet weak var A80: UIButton!
    @IBOutlet weak var A81: UIButton!
    @IBOutlet weak var A82: UIButton!
    @IBOutlet weak var A83: UIButton!
    @IBOutlet weak var A84: UIButton!
    @IBOutlet weak var A85: UIButton!
    @IBOutlet weak var A86: UIButton!
    @IBOutlet weak var A87: UIButton!
    @IBOutlet weak var A88: UIButton!
    @IBOutlet weak var A89: UIButton!
    // Row 9
    @IBOutlet weak var A90: UIButton!
    @IBOutlet weak var A91: UIButton!
    @IBOutlet weak var A92: UIButton!
    @IBOutlet weak var A93: UIButton!
    @IBOutlet weak var A94: UIButton!
    @IBOutlet weak var A95: UIButton!
    @IBOutlet weak var A96: UIButton!
    @IBOutlet weak var A97: UIButton!
    @IBOutlet weak var A98: UIButton!
    @IBOutlet weak var A99: UIButton!
    
    // Word Labels
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var word2: UILabel!
    @IBOutlet weak var word3: UILabel!
    @IBOutlet weak var word4: UILabel!
    @IBOutlet weak var word5: UILabel!
    @IBOutlet weak var word6: UILabel!
    @IBOutlet weak var word7: UILabel!
    @IBOutlet weak var word8: UILabel!
    @IBOutlet weak var word9: UILabel!
    @IBOutlet weak var word10: UILabel!
    @IBOutlet weak var word11: UILabel!
    @IBOutlet weak var word12: UILabel!
    @IBOutlet weak var word13: UILabel!
    @IBOutlet weak var word14: UILabel!
    @IBOutlet weak var word15: UILabel!
    
    // Word_Pressed
    @IBOutlet weak var word_Output: UILabel!
    
    // Message Label
    @IBOutlet weak var message: UILabel!
    
    // word_count Label
    @IBOutlet weak var word_count_label: UILabel!
    
    var word_count: Int = 0
    
    // Result Button
    @IBOutlet weak var resultBtn: UIButton!
    
    // Alphabet
    let alphabet: Array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    // Dictionary of words
    // This level requires 15 words, so we should use words in length from 3 to 5 letters for easily insert into word cells. Otherwise, the machine will be exhaustive finding a space for long words
    let master_word_bank: Array = ["LIFE", "LOVE", "NEAR", "NESS", "RING", "WOLF", "FISH", "FIVE", "KING",
                                   "AIR", "CAT", "ACE", "SEA", "ANT", "SUN",
                                   "WORLD", "HEART", "BOARD", "PARTY", "MOUTH", "DREAM", "FAITH", "PEACE",
                                   "LAND", "ROCK", "ROSE", "HOPE", "WIND", "DARK", "GOAT", "SHIP"]
    
    
    // array of word_directions
    let word_directions: Array = ["vertical","horizontal", "rightleft_diagonal", "leftright_diagonal" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        isTimerOn.toggle()
        isTimerOn = true
        toggleTimer(on: isTimerOn)
        
        // Create word bank
        createWordBank(_wordNum: 15)
        setWordsToLabels()
        randomlyInsertWord()
        fillEmptyButtons()


        if let lv1 = level1Outcome {
            level1OutcomeLbl.text = lv1
        }
        if let lv2 = level2Outcome {
            level2OutcomeLbl.text = lv2
        }
        // Do any additional setup after loading the view.
    }
    
    // Words randomly chosen for this level will go here
    var word_bank: [String] = []
    
    // Fills word_bank with words
    func createWordBank(_wordNum:Int) {
        while word_bank.count < _wordNum {
            let word = master_word_bank.randomElement()
            if !word_bank.contains(word!) {
                word_bank.append(word!)
            }
        }
    }
    
    // Fill empty buttons
    func fillEmptyButtons() {
        let buttonsArr: [[UIButton]] = loadButtonArray()
        for a in 0...9 {
            for b in 0...9 {
                if buttonsArr[a][b].currentTitle == nil {
                    buttonsArr[a][b].setTitle(alphabet.randomElement(), for: .normal)
                }
            }
        }
    }
    
    // Set Words to Labels
    func setWordsToLabels() {
        word1.text = word_bank[0]
        word2.text = word_bank[1]
        word3.text = word_bank[2]
        word4.text = word_bank[3]
        word5.text = word_bank[4]
        word6.text = word_bank[5]
        word7.text = word_bank[6]
        word8.text = word_bank[7]
        word9.text = word_bank[8]
        word10.text = word_bank[9]
        word11.text = word_bank[10]
        word12.text = word_bank[11]
        word13.text = word_bank[12]
        word14.text = word_bank[13]
        word15.text = word_bank[14]
    }
    
    // Display letters when each letter is pressed
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        if sender.isSelected == false{
            sender.isSelected = true
            word_Output.text = word_Output.text! + String(sender.currentTitle!)
        }
        else if sender.isSelected == true{
            sender.isSelected = false
            var count = word_Output.text!.count
            var removed = false
            while (count > 0){
                if (removed == false) {
                    removed = true
                }
                else{
                }
                count = count - 1
            }
        }
    }
    
    // Randomly inserting word into buttons
    func randomlyInsertWord() {
        // Array of referenced Buttons
        var arr: [[UIButton]] = loadButtonArray()
        for word in word_bank {
            for _ in 0..<1000000000000000 {
                // generate random row index
                var row:Int = Int(arc4random_uniform(10))
                // generate random col index
                var col:Int = Int(arc4random_uniform(10))
                // generate random word direction
                let word_direction = word_directions.randomElement()
                // condition_flag: check
                //      + if has enough space for word from random col/row index
                //      + if word has not overlapped other words
                var condition_flag: Bool = false;
                // done_flag: check if all condition match and each letter in word has been located
                var done_flag: Bool = false;
                // different cases for specific word_direction
                switch word_direction {
                // if word goes vertically
                case "vertical":
                    condition_flag = checkCondition(arr, "vertical", row, col, word)
                    done_flag = !condition_flag
                    // all conditions match, assign letters to verified buttons
                    if condition_flag == false {
                        done_flag = true
                        for char in word {
                            //                                print(row, col, word)
                            arr[row][col].setTitle(String(char), for: .normal)
                            row += 1
                        }
                    }
                    break
                // if word goes horizontally
                case "horizontal":
                    condition_flag = checkCondition(arr, "horizontal", row, col, word)
                    done_flag = !condition_flag
                    // all conditions match, assign letters to verified buttons
                    if condition_flag == false {
                        done_flag = true
                        for char in word {
                            //                                print(row, col, word)
                            arr[row][col].setTitle(String(char), for: .normal)
                            col += 1
                        }
                    }
                    break
                // if word goes rightleft_diagonal
                case "rightleft_diagonal":
                    condition_flag = checkCondition(arr, "rightleft_diagonal", row, col, word)
                    done_flag = !condition_flag
                    // all conditions match, assign letters to verified buttons
                    if condition_flag == false {
                        done_flag = true
                        for char in word {
                            //                                print(row, col, word)
                            arr[row][col].setTitle(String(char), for: .normal)
                            col -= 1
                            row += 1
                        }
                    }
                    break
                // if word goes leftright_diagonal
                case "leftright_diagonal":
                    condition_flag = checkCondition(arr, "leftright_diagonal", row, col, word)
                    done_flag = !condition_flag
                    // all conditions match, assign letters to verified buttons
                    if condition_flag == false {
                        done_flag = true
                        for char in word {
                            //                                print(row, col, word)
                            arr[row][col].setTitle(String(char), for: .normal)
                            col += 1
                            row += 1
                        }
                    }
                    break
                    
                default:
                    break
                }
                if condition_flag {
                    continue
                }
                if done_flag {
                    break
                }
            }
        }
    }
    
    // load buttons array
    func loadButtonArray() -> [[UIButton]] {
        return [[A00, A01, A02, A03, A04, A05, A06, A07, A08, A09],
                [A10, A11, A12, A13, A14, A15, A16, A17, A18, A19],
                [A20, A21, A22, A23, A24, A25, A26, A27, A28, A29],
                [A30, A31, A32, A33, A34, A35, A36, A37, A38, A39],
                [A40, A41, A42, A43, A44, A45, A46, A47, A48, A49],
                [A50, A51, A52, A53, A54, A55, A56, A57, A58, A59],
                [A60, A61, A62, A63, A64, A65, A66, A67, A68, A69],
                [A70, A71, A72, A73, A74, A75, A76, A77, A78, A79],
                [A80, A81, A82, A83, A84, A85, A86, A87, A88, A89],
                [A90, A91, A92, A93, A94, A95, A96, A97, A98, A99],
        ]
    }
    
    // Check condition to put word into cells
    func checkCondition(_ arr: [[UIButton?]], _ direction: String, _ row: Int, _ col: Int, _ word: String) -> Bool {
        switch direction {
        case "vertical":
            // check if not have enough space for word
            if (row > (10 - word.count)) {
                return true
            } else {
                // check if not have enough space for word
                for i in row..<(row + word.count){
                    //                                print(i, col)
                    if arr[i][col]?.currentTitle != nil {
                        return true
                    }
                }
                return false
            }
            
        case "horizontal":
            // check if not have enough space for word
            if (col > (10 - word.count)) {
                return true;
            } else {
                // check if word is overlapped
                for i in col..<(col + word.count){
                    //                                print(row, i)
                    if arr[row][i]?.currentTitle != nil {
                        return true
                    }
                }
                return false
            }
        case "rightleft_diagonal":
            // check if not have enough space for word
            if ((col < word.count - 1) && (row > 10 - word.count))  {
                return true
            } else if ((col >= word.count - 1) && (row <= 10 - word.count)) {
                // check if word is overlapped
                var temp_row = row
                var temp_col = col
                for _ in 0..<word.count {
                    if arr[temp_row][temp_col]?.currentTitle != nil {
                        return true
                    }
                    temp_row += 1
                    temp_col -= 1
                }
                return false
            }
            
        case "leftright_diagonal":
            // check if not have enough space for word
            if ((col > (10 - word.count)) && (row > 10 - word.count))  {
                return true
            } else if ((col <= (10 - word.count)) && (row <= 10 - word.count)) {
                // check if word is overlapped
                var temp_row = row
                var temp_col = col
                for _ in 0..<word.count {
                    if arr[temp_row][temp_col]?.currentTitle != nil {
                        return true
                    }
                    temp_row += 1
                    temp_col += 1
                }
                return false
            }
            
        default:
            break
        }
        return true
    }
    
    // reset word and button being selected when RESET button is pressed
    @IBAction func resetWord(_ sender: Any) {
        word_Output.text = ""
        resetSelectedButton()
    }
    
    
    // Check Word
    @IBAction func checkWord(_ sender: Any) {
        if word_bank.contains(word_Output.text!) && checkLetters() {
            message.text = "CORRECT!!!"
            message.backgroundColor = UIColor.green
            let outputLabels: [UILabel] = loadOutputLabelArr()
            for label in outputLabels {
                if label.text == word_Output.text {
                    label.backgroundColor = UIColor.green
                }
            }
            word_count += 1
            word_count_label.text = "\(word_count)/15 Words"
            refillCorrectedWord()
        } else {
            message.text = "TRY AGAIN!!!"
            message.backgroundColor = UIColor.yellow
        }
        if word_count == 15 {
            resultBtn.isHidden = false
        }
        messageApper(message)
        word_Output.text = ""
        resetSelectedButton()
    }
    
    // Reset all buttons are being selected
    func resetSelectedButton() {
        let buttonArr: [[UIButton]] = loadButtonArray()
        for a in 0...9 {
            for b in 0...9 {
                buttonArr[a][b].isSelected = false
            }
        }
    }
    
    // Show message in 3 seconds
    func messageApper(_ message: UILabel) {
        message.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            message.isHidden = true
        }
    }
    
    // load output labels array
    func loadOutputLabelArr() -> [UILabel] {
        return [word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13, word14, word15]
    }
    
    // Refill corrected word with random letters
    func refillCorrectedWord () {
        var buttonsArr: [[UIButton]] = loadButtonArray()
        for a in 0...9 {
            for b in 0...9 {
                if buttonsArr[a][b].isSelected ==  true {
                    buttonsArr[a][b].setTitle(alphabet.randomElement(), for: .normal)
                }
            }
        }
    }
    
    // Checks if letters are in order/adjacent to each other
    func checkLetters () -> Bool {
        // Checks for all selected buttons and adds them into an array.
        var buttonsArr: [[UIButton]] = loadButtonArray()
        var selectedButtons: [String] = []
        for a in 0...9 {
            for b in 0...9 {
                if buttonsArr[a][b].isSelected ==  true {
                    let val = "\(a)\(b)"
                    selectedButtons.append(val)
                }
            }
        }
        // Uses selected buttons array and checks that each button is adjacent to the next one (horizontally, vertically, rightleft-diagonally, leftright-diagonally), then puts the direction (horizontal, vertical, rightleft-diagonally, leftright-diagonally) into an array
        var direction: [String] = []
        for i in 1..<selectedButtons.count {
            if selectedButtons[i-1].prefix(1) == selectedButtons[i].prefix(1) &&
                Int(selectedButtons[i-1].suffix(1))! == Int(selectedButtons[i].suffix(1))! - 1 {
                direction.append("V")
            }
            else if selectedButtons[i-1].suffix(1) == selectedButtons[i].suffix(1) &&
                Int(selectedButtons[i-1].prefix(1))! == Int(selectedButtons[i].prefix(1))! - 1 {
                direction.append("H")
            }
            else if Int(selectedButtons[i-1].prefix(1)) == Int(selectedButtons[i].prefix(1))! - 1 &&
                Int(selectedButtons[i-1].suffix(1)) == Int(selectedButtons[i].suffix(1))! + 1 {
                direction.append("RLD")
            }
            else if Int(selectedButtons[i-1].prefix(1)) == Int(selectedButtons[i].prefix(1))! - 1 &&
                Int(selectedButtons[i-1].suffix(1)) == Int(selectedButtons[i].suffix(1))! - 1 {
                direction.append("LRD")
            }
            else {
                return false
            }
        }
        // Checks the direction array to make sure all shifts are only horizontal, or only vertical, or only rightleft-diagonally, or only leftright-diagonally.
        for i in direction{
            if direction[0] != i {
                return false
            }
        }
        return true
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
    

    @IBAction func checkBtn(_ sender: Any) {
        timer.invalidate()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultShow" {
            let dc = segue.destination as! ResultsViewController
            if let lv1 = level1Outcome {
                dc.level1Outcome = lv1
            }
            if let lv2 = level2Outcome {
                dc.level2Outcome = lv2
            }
            dc.level3Outcome = String(duration)
        }
    }
    

}
