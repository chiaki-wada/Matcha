//
//  HiraganaQuestionViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/26.
//

import UIKit

class HiraganaQuestionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var checkmarkImageView: UIImageView!
    @IBOutlet var goodjobLabel: UILabel!
    @IBOutlet var relearnImageView: UIImageView!
    @IBOutlet var kotaeLabel: UILabel!
    
    var CHAPTER: Int = 0
    var LEVEL: Int = 0
    
    var n1ch1array = [
        ["hiragana":"ぶんしょ","meaning":"document, writing, paperwork"],
        ["hiragana":"だげき","meaning":"blow, shock, strike"],
        ["hiragana":"ほうしゅう","meaning":"emuneration, recompense, reward"],
        ["hiragana":"いみん","meaning":"emigration, immigration"],
        ["hiragana":"いぜん","meaning":"still; as yet; as it has been"],
        ["hiragana":"じぞく","meaning":"continuation; persisting; lasting; sustaining; enduring"],
        ["hiragana":"かたむける","meaning":"to incline, to lean, to tilt"],
        ["hiragana":"こうい","meaning":"good will, favor, courtesy"],
        ["hiragana":"こうにゅう","meaning":"purchase, buy"],
        ["hiragana":"めいりょう","meaning":"clear; plain; distinct; obvious; evident; articulate"],
        ["hiragana":"りろん","meaning":"theory"],
        ["hiragana":"せつりつ","meaning":"establishment, founding"],
        ["hiragana":"しや","meaning":"field of vision; view; one’;s outlook"],
        ["hiragana":"しょうすう","meaning":"minority; few"],
        ["hiragana":"つのる","meaning":"to grow violent, to become stronger"],
        ["hiragana":"よち","meaning":"place, room, margin"],
        ["hiragana":"ざいせい","meaning":"public finance, financial affairs"],
        ["hiragana":"ちょうせん","meaning":"challenge, defiance, dare"],
        ["hiragana":"ふとう","meaning":"injustice, impropriety, unfair"],
        ["hiragana":"ぐんじ","meaning":"military affairs"]
        
    ]
    var n1ch2array = [
        ["hiragana":"かだい","meaning":"subject; theme; issue; matter; homework; assignment; task; challenge; problem; question"],
        ["hiragana":"きこう","meaning":"mechanism, organization"],
        ["hiragana":"きそう","meaning":"to compete; to contend; to vie; to contest"],
        ["hiragana":"きょうれつ","meaning":"strong, intense, severe"],
        ["hiragana":"りせい","meaning":"reason, reasoning power"],
        ["hiragana":"りょういき","meaning":"area; domain; territory; field; range; region; regime"],
        ["hiragana":"せんとう","meaning":"battle, fight, combat"],
        ["hiragana":"しじ","meaning":"instructions, directions, indication"],
        ["hiragana":"しかく","meaning":"qualifications; requirements; capabilities"],
        ["hiragana":"しこう","meaning":"thought; consideration; thinking"],
        ["hiragana":"しょうめい","meaning":"illumination; lighting"],
        ["hiragana":"しょうれい","meaning":"encouragement, promotion"],
        ["hiragana":"しょうり","meaning":"victory, triumph, win"],
        ["hiragana":"とぼしい","meaning":"meagre; meager; scarce; limited; destitute; hard up; lacking; scanty; poor"],
        ["hiragana":"ぞうきょう","meaning":"augment, reinforce, increase"],
        ["hiragana":"あやまち","meaning":"fault, error, indiscretion"],
        ["hiragana":"どくさい","meaning":"dictatorship, despotism"],
        ["hiragana":"じかく","meaning":"self-consciousness; self-awareness"],
        ["hiragana":"じぜん","meaning":"prior; beforehand; in advance; before the fact; ex ante"],
        ["hiragana":"かんし","meaning":"monitoring, watching, observation"],
    ]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        // 初期状態で非表示に設定する
        checkmarkImageView.isHidden = true
        goodjobLabel.isHidden = true
        relearnImageView.isHidden = true
        kotaeLabel.isHidden = true
        
        if let level = UserDefaults.standard.object(forKey: "LEVEL") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            LEVEL = level
            CHAPTER = chapter
        }
        
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            meaningLabel.text = n1ch1array[currentQuestionIndex]["meaning"]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            meaningLabel.text = n1ch2array[currentQuestionIndex]["meaning"]
        }
        
    }
    
    @IBAction func tapCheckButton() {
        
        guard let answer = textField.text else { return }
        
        let currentQuestionArray = (LEVEL == 0 && CHAPTER == 0) ? n1ch1array : n1ch2array
        let currentQuestion = currentQuestionArray[currentQuestionIndex]
        
        if answer == currentQuestion["hiragana"] {
            checkmarkImageView.isHidden = false
            goodjobLabel.isHidden = false
            
            currentQuestionIndex += 1
            
            if currentQuestionIndex < currentQuestionArray.count {
                let nextQuestion = currentQuestionArray[currentQuestionIndex]
                meaningLabel.text = nextQuestion["meaning"]
            } else {
                // Reached the end of the question array
                // Handle completion or transition to the next level/chapter
                // NextViewControllerに遷移するコードを追加する！
            }
            
            textField.text = ""
        } else {
            relearnImageView.isHidden = false
            kotaeLabel.isHidden = false
            kotaeLabel.text = currentQuestion["hiragana"]
        }
        
        // ビューを非表示にする
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkmarkImageView.isHidden = true
            self.goodjobLabel.isHidden = true
            self.relearnImageView.isHidden = true
            self.kotaeLabel.isHidden = true
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
