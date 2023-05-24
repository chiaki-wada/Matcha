//
//  HiraganaInputViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/24.
//

import UIKit

class HiraganaInputViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var hiraganaLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var index = 0
    
    var CHAPTER = saveData.object(forKey:"CHAPTER")
    var LEVEL = saveData.object(forKey:"LEVEL")
    
    var n1ch1array = [
        ["hiragana":"すいえい","meaning":"swimming"],
        ["hiragana":"とざん","meaning":"mountain climbing"],
        ["hiragana":"ぶよう","meaning":"dancing"]
    ]
    var n1ch2array = ["hiragana":"","meaning":""]
    var n1ch3array = ["hiragana":"","meaning":""]
    
    var n2ch1array = ["hiragana":"","meaning":""]
    var n2ch2array = ["hiragana":"","meaning":""]
    var n2ch3array = ["hiragana":"","meaning":""]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            return n1ch1array.count
        }
        if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            return n1ch2array.count
        }
        if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            return n1ch3array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 0 {
            return n1ch1array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            return n1ch2array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            return n2ch3array.count
        }
        return n1ch3array.count
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = true
        
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            hiraganaLabel.text = n1ch1array[0]["hiragana"]
            meaningLabel.text = n1ch1array[0]["meaning"]
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 0 {
            titleLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            titleLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
        }
        
    }
    
    @IBAction func tapnextButton() {
        
        index += 1
        
        if index >= n1ch1array.count-1 {
            nextButton.isHidden = true
        }
        backButton.isHidden = false
        hiraganaLabel.text = n1ch1array[index]["hiragana"]
        meaningLabel.text = n1ch1array[index]["meaning"]
        
    }
    
    @IBAction func tapbackButton() {
        
        index -= 1
        
        if index == 0 {
            backButton.isHidden = true
        }
        nextButton.isHidden = false
        
        hiraganaLabel.text = n1ch1array[index]["hiragana"]
        meaningLabel.text = n1ch1array[index]["meaning"]
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
