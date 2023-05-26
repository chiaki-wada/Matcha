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
            hiraganaLabel.text = n1ch1array[0]["hiragana"]
            meaningLabel.text = n1ch1array[0]["meaning"]
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            hiraganaLabel.text = n1ch2array[0]["hiragana"]
            meaningLabel.text = n1ch2array[0]["meaning"]
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            titleLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            hiraganaLabel.text = n1ch3array[0]["hiragana"]
            meaningLabel.text = n1ch3array[0]["meaning"]
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
