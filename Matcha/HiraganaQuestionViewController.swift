//
//  kanjiQuestionViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/26.
//

import UIKit

class kanjiQuestionViewController: UIViewController, UITextFieldDelegate {
    
    
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
        ["kanji":"文書","meaning":"document, writing, paperwork"],
        ["kanji":"打撃","meaning":"blow, shock, strike"],
        ["kanji":"報酬","meaning":"emuneration, recompense, reward"],
        ["kanji":"移民","meaning":"emigration, immigration"],
        ["kanji":"依然","meaning":"still; as yet; as it has been"],
        ["kanji":"持続","meaning":"continuation; persisting; lasting; sustaining; enduring"],
        ["kanji":"傾ける","meaning":"to incline, to lean, to tilt"],
        ["kanji":"厚意","meaning":"good will, favor, courtesy"],
        ["kanji":"購入","meaning":"purchase, buy"],
        ["kanji":"明瞭","meaning":"clear; plain; distinct; obvious; evident; articulate"],
        ["kanji":"理論","meaning":"theory"],
        ["kanji":"設立","meaning":"establishment, founding"],
        ["kanji":"視野","meaning":"field of vision; view; one’;s outlook"],
        ["kanji":"少数","meaning":"minority; few"],
        ["kanji":"募る","meaning":"to grow violent, to become stronger"],
        ["kanji":"余地","meaning":"place, room, margin"],
        ["kanji":"財政","meaning":"public finance, financial affairs"],
        ["kanji":"挑戦","meaning":"challenge, defiance, dare"],
        ["kanji":"不当","meaning":"injustice, impropriety, unfair"],
        ["kanji":"軍事","meaning":"military affairs"]
        
    ]
    var n1ch2array = [
        ["kanji":"課題","meaning":"subject; theme; issue; matter; homework; assignment; task; challenge; problem; question"],
        ["kanji":"機構","meaning":"mechanism, organization"],
        ["kanji":"きそう","meaning":"to compete; to contend; to vie; to contest"],
        ["kanji":"きょうれつ","meaning":"strong, intense, severe"],
        ["kanji":"りせい","meaning":"reason, reasoning power"],
        ["kanji":"りょういき","meaning":"area; domain; territory; field; range; region; regime"],
        ["kanji":"せんとう","meaning":"battle, fight, combat"],
        ["kanji":"しじ","meaning":"instructions, directions, indication"],
        ["kanji":"しかく","meaning":"qualifications; requirements; capabilities"],
        ["kanji":"しこう","meaning":"thought; consideration; thinking"],
        ["kanji":"しょうめい","meaning":"illumination; lighting"],
        ["kanji":"しょうれい","meaning":"encouragement, promotion"],
        ["kanji":"しょうり","meaning":"victory, triumph, win"],
        ["kanji":"とぼしい","meaning":"meagre; meager; scarce; limited; destitute; hard up; lacking; scanty; poor"],
        ["kanji":"ぞうきょう","meaning":"augment, reinforce, increase"],
        ["kanji":"あやまち","meaning":"fault, error, indiscretion"],
        ["kanji":"どくさい","meaning":"dictatorship, despotism"],
        ["kanji":"じかく","meaning":"self-consciousness; self-awareness"],
        ["kanji":"じぜん","meaning":"prior; beforehand; in advance; before the fact; ex ante"],
        ["kanji":"かんし","meaning":"monitoring, watching, observation"],
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
        
        if answer == currentQuestion["kanji"] {
            checkmarkImageView.isHidden = false
            goodjobLabel.isHidden = false
            
            currentQuestionIndex += 1
            
            if currentQuestionIndex < currentQuestionArray.count {
                let nextQuestion = currentQuestionArray[currentQuestionIndex]
                meaningLabel.text = nextQuestion["meaning"]
            } else {
                // Reached the end of the question array
                // Handle completion or transition to the next level/chapter
                // NextViewControllerに遷移するコードを追加する！h
            }
            
            textField.text = ""
        } else {
            relearnImageView.isHidden = false
            kotaeLabel.isHidden = false
            kotaeLabel.text = currentQuestion["kanji"]
        }
        
        // ビューを非表示にする
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
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
