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
    @IBOutlet var yomiganaLabel: UILabel!
    
    var CHAPTER: Int = 0
    var LEVEL: Int = 0
    
    var n1ch1array = [
        ["hiragana":"ぶんしょ","kanji":"文書","meaning":"document, writing, paperwork"],
        ["hiragana":"だげき","kanji":"打撃","meaning":"blow, shock, strike"],
        ["hiragana":"ほうしゅう","kanji":"報酬","meaning":"emuneration, recompense, reward"],
        ["hiragana":"いみん","kanji":"移民","meaning":"emigration, immigration"],
        ["hiragana":"いぜん","kanji":"依然","meaning":"still; as yet; as it has been"],
        ["hiragana":"じぞく","kanji":"持続","meaning":"continuation; persisting; lasting; sustaining; enduring"],
        ["hiragana":"かたむける","kanji":"傾ける","meaning":"to incline, to lean, to tilt"],
        ["hiragana":"こうい","kanji":"厚意","meaning":"good will, favor, courtesy"],
        ["hiragana":"こうにゅう","kanji":"購入","meaning":"purchase, buy"],
        ["hiragana":"めいりょう","kanji":"明瞭","meaning":"clear; plain; distinct; obvious; evident; articulate"],
        ["hiragana":"りろん","kanji":"理論","meaning":"theory"],
        ["hiragana":"せつりつ","kanji":"設立","meaning":"establishment, founding"],
        ["hiragana":"しや","kanji":"視野","meaning":"field of vision; view; one’s outlook"],
        ["hiragana":"しょうすう","kanji":"少数","meaning":"minority; few"],
        ["hiragana":"つのる","kanji":"募る","meaning":"to grow violent, to become stronger"],
        ["hiragana":"よち","kanji":"余地","meaning":"place, room, margin"],
        ["hiragana":"ざいせい","kanji":"財政","meaning":"public finance, financial affairs"],
        ["hiragana":"ちょうせん","kanji":"挑戦","meaning":"challenge, defiance, dare"],
        ["hiragana":"ふとう","kanji":"不当","meaning":"injustice, impropriety, unfair"],
        ["hiragana":"ぐんじ","kanji":"軍事","meaning":"military affairs"]
        
    ]
    var n1ch2array = [
        ["hiragana":"かだい","kanji":"課題","meaning":"subject; theme; issue; matter; homework; assignment; task; challenge; problem; question"],
        ["hiragana":"きこう","kanji":"機構","meaning":"mechanism, organization"],
        ["hiragana":"きそう","kanji":"競う","meaning":"to compete; to contend; to vie; to contest"],
        ["hiragana":"きょうれつ","kanji":"強烈","meaning":"strong, intense, severe"],
        ["hiragana":"りせい","kanji":"理性","meaning":"reason, reasoning power"],
        ["hiragana":"りょういき","kanji":"領域","meaning":"area; domain; territory; field; range; region; regime"],
        ["hiragana":"せんとう","kanji":"戦闘","meaning":"battle, fight, combat"],
        ["hiragana":"しじ","kanji":"指示","meaning":"instructions, directions, indication"],
        ["hiragana":"しかく","kanji":"資格","meaning":"qualifications; requirements; capabilities"],
        ["hiragana":"しこう","kanji":"思考","meaning":"thought; consideration; thinking"],
        ["hiragana":"しょうめい","kanji":"照明","meaning":"illumination; lighting"],
        ["hiragana":"しょうれい","kanji":"奨励","meaning":"encouragement, promotion"],
        ["hiragana":"しょうり","kanji":"勝利","meaning":"victory, triumph, win"],
        ["hiragana":"とぼしい","kanji":"乏しい","meaning":"meager; scarce; limited; destitute; lacking; scanty"],
        ["hiragana":"ぞうきょう","kanji":"増強","meaning":"augment, reinforce, increase"],
        ["hiragana":"あやまち","kanji":"過ち","meaning":"fault, error, indiscretion"],
        ["hiragana":"どくさい","kanji":"独裁","meaning":"dictatorship, despotism"],
        ["hiragana":"じかく","kanji":"自覚","meaning":"self-consciousness; self-awareness"],
        ["hiragana":"じぜん","kanji":"事前","meaning":"prior; beforehand; in advance; before the fact; ex ante"],
        ["hiragana":"かんし","kanji":"監視","meaning":"monitoring, watching, observation"]
        
    ]
    var n1ch3array = [
        ["hiragana":"しきん","kanji":"資金","meaning":"funds, capital"],
        ["hiragana":"しょゆう","kanji":"所有","meaning":"one’s possessions; ownership"],
        ["hiragana":"そまる","kanji":"染まる","meaning":"to be dyed; to be tainted; to be infected; to be stained; to be steeped"],
        ["hiragana":"そくざに","kanji":"即座に","meaning":"immediately; right away; on the spot"],
        ["hiragana":"たいしゅう","kanji":"大衆","meaning":"general public, the masses"],
        ["hiragana":"うごき","kanji":"動き","meaning":"movement; move; motion; trend; development; change; fluctuation"],
        ["hiragana":"ゆうし","kanji":"融資","meaning":"financing, loan"],
        ["hiragana":"ぜつぼう","kanji":"絶望","meaning":"despair, hopelessness"],
        ["hiragana":"びんぼう","kanji":"貧乏","meaning":"poverty, destitute, poor"],
        ["hiragana":"ぼうえい","kanji":"防衛","meaning":"defense, protection"],
        ["hiragana":"どういん","kanji":"動員","meaning":"mobilization"],
        ["hiragana":"はいご","kanji":"背後","meaning":"back, rear, background"],
        ["hiragana":"はんのう","kanji":"反応","meaning":"reaction, response"],
        ["hiragana":"ひきいる","kanji":"率いる","meaning":"to lead, to command"],
        ["hiragana":"ほんしつ","kanji":"本質","meaning":"essence, true nature"],
        ["hiragana":"いじゅう","kanji":"移住","meaning":"migration, immigration"],
        ["hiragana":"いよく","kanji":"意欲","meaning":"will; desire; ambition; urge"],
        ["hiragana":"かんじん","kanji":"肝心","meaning":"essential, fundamental, crucial"],
        ["hiragana":"きせい","kanji":"規制","meaning":"regulation, control, restriction"],
        ["hiragana":"ねつい","kanji":"熱意","meaning":"zeal, enthusiasm"]
    ]
    
    var currentQuestionIndex: Int = 0
    var shuffledQuestions: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        textField.delegate = self
        
        // 初期状態で非表示に設定する
        checkmarkImageView.isHidden = true
        goodjobLabel.isHidden = true
        relearnImageView.isHidden = true
        kotaeLabel.isHidden = true
        yomiganaLabel.isHidden = true
        
        if let level = UserDefaults.standard.object(forKey: "LEVEL") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            LEVEL = level
            CHAPTER = chapter
        }
        
        if LEVEL == 0 && CHAPTER == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch1array)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch2array)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 2 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch3array)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        }
    }
    
    // 問題の配列をランダムにシャッフルする関数
    func shuffleArray(_ array: [[String:String]]) -> [[String:String]] {
        var newArray = array
        for i in 0..<newArray.count {
            let randomIndex = Int.random(in: i..<newArray.count)
            let temp = newArray[i]
            newArray[i] = newArray[randomIndex]
            newArray[randomIndex] = temp
        }
        return newArray
    }
    
    @IBAction func tapCheckButton() {
        
        guard let answer = textField.text else { return }
        
        let currentQuestionArray = (LEVEL == 0 && CHAPTER == 0) ? n1ch1array : ((LEVEL == 0 && CHAPTER == 1) ? n1ch2array : n1ch3array)
        let currentQuestion = shuffledQuestions[currentQuestionIndex]
        
        let shuffledAnswer = currentQuestion["kanji"]
        let shuffledHiragana = currentQuestion["hiragana"]
        
        if answer == shuffledAnswer {
            checkmarkImageView.isHidden = false
            goodjobLabel.isHidden = false
            
            if currentQuestionIndex < shuffledQuestions.count - 1 {
                currentQuestionIndex += 1
                let nextQuestion = shuffledQuestions[currentQuestionIndex]
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
            yomiganaLabel.isHidden = false
            kotaeLabel.text = shuffledAnswer
            yomiganaLabel.text = shuffledHiragana
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkmarkImageView.isHidden = true
            self.goodjobLabel.isHidden = true
            self.relearnImageView.isHidden = true
            self.kotaeLabel.isHidden = true
            self.yomiganaLabel.isHidden = true
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
