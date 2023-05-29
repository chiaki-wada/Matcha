//
//  QuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/28.
//

import UIKit

class QuizViewController: UIViewController, UITextFieldDelegate {
    
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
        ["kanji":"報酬","meaning":"emuneration, recompense, reward"]
        
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
            
            if currentQuestionIndex < currentQuestionArray.count - 1 {
                currentQuestionIndex += 1
                let nextQuestion = currentQuestionArray[currentQuestionIndex]
                meaningLabel.text = nextQuestion["meaning"]
                
                textField.text = ""
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let finishViewController = storyboard.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
                    self.navigationController?.pushViewController(finishViewController, animated: true)
                }
                return
            }
        } else {
            relearnImageView.isHidden = false
            kotaeLabel.isHidden = false
            kotaeLabel.text = currentQuestion["kanji"]
        }
        
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

