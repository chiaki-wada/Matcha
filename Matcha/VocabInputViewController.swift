//
//  VocabInputViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/28.
//

import UIKit

class VocabInputViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var cardButton: UIButton!
    
    @IBOutlet var hiraganaLabel: UILabel!
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var currentArray: [[String: String]] = []
    var index = 0
    
    var CHAPTER = saveData.object(forKey:"CHAPTER")
    var LEVEL = saveData.object(forKey:"LEVEL")
    
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
        ["hiragana":"しや","kanji":"視野","meaning":"field of vision; view; one’;s outlook"],
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
        ["hiragana":"かんし","kanji":"監視","meaning":"monitoring, watching, observation"],
    ]
    
    var n1ch3array = [
        ["hiragana":"しきん","meaning":"funds, capital"],
        ["hiragana":"しょゆう","meaning":"one’;s possessions; ownership"],
        ["hiragana":"そまる","meaning":"to be dyed; to be tainted; to be infected; to be stained; to be steeped"],
        ["hiragana":"そくざに","meaning":"immediately; right away; on the spot"],
        ["hiragana":"たいしゅう","meaning":"general public, the masses"],
        ["hiragana":"うごき","meaning":"movement; move; motion; trend; development; change; fluctuation"],
        ["hiragana":"ゆうし","meaning":"financing, loan"],
        ["hiragana":"ぜつぼう","meaning":"despair, hopelessness"],
        ["hiragana":"びんぼう","meaning":"poverty, destitute, poor"],
        ["hiragana":"ぼうえい","meaning":"defense, protection"],
        ["hiragana":"どういん","meaning":"mobilization"],
        ["hiragana":"はいご","meaning":"back, rear, background"],
        ["hiragana":"はんのう","meaning":"reaction, response"],
        ["hiragana":"ひきいる","meaning":"to lead, to command"],
        ["hiragana":"ほんしつ","meaning":"essence, true nature"],
        ["hiragana":"いじゅう","meaning":"migration, immigration"],
        ["hiragana":"いよく","meaning":"will; desire; ambition; urge"],
        ["hiragana":"かんじん","meaning":"essential, fundamental, crucial"],
        ["hiragana":"きせい","meaning":"regulation, control, restriction"],
        ["hiragana":"ねつい","meaning":"zeal, enthusiasm"]
    ]
    var n2ch1array = [
        ["hiragana":"","meaning":""]
    ]
    
    var n2ch2array = [
        ["hiragana":"","meaning":""]
    ]
    
    var n2ch3array = [
        ["hiragana":"","meaning":""]
    ]
    
    var isShowingMeaning = false
    
    
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
            return n2ch1array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            return n2ch2array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            return n2ch3array.count
        }
        return n2ch3array.count
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = true
        
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch1array[0])
        }
        
        updateCurrentArray()
        updateCard()
    }
    
    func updateCurrentArray() {
        if let level = LEVEL as? Int, let chapter = CHAPTER as? Int {
            if level == 0 && chapter == 0 {
                currentArray = n1ch1array
            } else if level == 0 && chapter == 1 {
                currentArray = n1ch2array
            } else if level == 0 && chapter == 2 {
                currentArray = n1ch3array
            } else if level == 1 && chapter == 0 {
                currentArray = n2ch1array
            } else if level == 1 && chapter == 1 {
                currentArray = n2ch2array
            } else if level == 1 && chapter == 2 {
                currentArray = n2ch3array
            }
        }
    }
    
    
    func updateLabels(with word: [String: String]) {
        hiraganaLabel.text = word["hiragana"]
        kanjiLabel.text = word["kanji"]
        meaningLabel.text = word["meaning"]
        
        if isShowingMeaning {
            meaningLabel.isHidden = false
            hiraganaLabel.isHidden = true
            kanjiLabel.isHidden = true
        } else {
            meaningLabel.isHidden = true
            hiraganaLabel.isHidden = false
            kanjiLabel.isHidden = false
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            updateCard()
        }
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        if index < n1ch1array.count - 1 {
            index += 1
            updateCard()
        }
    }
    
    @IBAction func tapCardButton(_ sender: UIButton) {
        toggleMeaning()
    }
    
    func updateCard() {
            let word = currentArray[index]
            
            hiraganaLabel.text = word["hiragana"]
            kanjiLabel.text = word["kanji"]
            meaningLabel.text = ""
            
            backButton.isHidden = (index == 0)
            nextButton.isHidden = (index == currentArray.count - 1)
            
            meaningLabel.isHidden = true
            hiraganaLabel.isHidden = false
            kanjiLabel.isHidden = false
        }

    
    func toggleMeaning() {
            let word = currentArray[index]
            
            if let meaning = word["meaning"] {
                meaningLabel.text = meaning
            }
            
            if meaningLabel.isHidden {
                meaningLabel.isHidden = false
                hiraganaLabel.isHidden = true
                kanjiLabel.isHidden = true
            } else {
                meaningLabel.isHidden = true
                hiraganaLabel.isHidden = false
                kanjiLabel.isHidden = false
            }
        }
    
    func getCurrentWord() -> [String: String] {
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            return n1ch1array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            return n1ch2array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            return n1ch3array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 0 {
            return n2ch1array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            return n2ch2array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            return n2ch3array[index]
        }
        return [:]
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
