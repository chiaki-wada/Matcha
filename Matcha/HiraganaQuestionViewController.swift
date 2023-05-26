//
//  HiraganaQuestionViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/26.
//

import UIKit

class HiraganaQuestionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var returnButton: UIButton!
    
    var CHAPTER = saveData.object(forKey:"CHAPTER")
    var LEVEL = saveData.object(forKey:"LEVEL")
    
    var n1ch1QuestionArray =  ["document, writing, paperwork","blow, shock, strike","emuneration, recompense, reward","emigration, immigration","still; as yet; as it has been","continuation; persisting; lasting; sustaining; enduring","to incline, to lean, to tilt","good will, favor, courtesy","purchase, buy","clear; plain; distinct; obvious; evident; articulate","theory","establishment, founding","field of vision; view; one’;s outlook","minority; few","to grow violent, to become stronger","place, room, margin","public finance, financial affairs","challenge, defiance, dare","injustice, impropriety, unfair","military affairs"]
    
    var n1ch1AnswerArray =  ["ぶんしょ","だげき","ほうしゅう","いみん","いぜん","じぞく","かたむける","こうい","こうにゅう","めいりょう","りろん","せつりつ","しや","しょうすう","つのる","よち","ざいせい","ちょうせん","ふとう","ぐんじ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    // UITextFieldの編集が完了した時に呼ばれるメソッド
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkAnswer()
    }
    
    // UITextFieldでReturnキーが押された時に呼ばれるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        checkAnswer()
        return true
    }
    
    // 答えのチェックを行うメソッド
    func checkAnswer() {
        guard let inputText = textField.text else {
            return
        }
        
        let trimmedInput = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        let currentIndex = n1ch1QuestionArray.firstIndex(of: trimmedInput)
        
        if let index = currentIndex, index < n1ch1AnswerArray.count {
            // 正解の場合
            textField.placeholder = "正解"
            textField.attributedPlaceholder = NSAttributedString(string: "正解", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
            // 次に進む処理を追加する
        } else {
            // 不正解の場合
            textField.placeholder = "不正解"
            textField.attributedPlaceholder = NSAttributedString(string: "不正解", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            // 答えを表示する処理を追加する
            let correctAnswer = n1ch1AnswerArray.first ?? ""
            print("正解は: \(correctAnswer)")
            // 次に進む処理を追加する
            
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
            
        }
    }
}
