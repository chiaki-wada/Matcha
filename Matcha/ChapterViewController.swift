//
//  ChapterViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/24.
//

import UIKit

let saveData = UserDefaults.standard

class ChapterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var chapterTableView: UITableView!
    
    var LEVEL = saveData.object(forKey:"LEVEL")
    
    var n1array = ["Chapter 1", "Chapter 2", "Chapter 3", "Chapter 4", "Chapter 5", "Chapter 6", "Chapter 7", "Chapter 8", "Chapter 9", "Chapter 10", "Chapter 11", "Chapter 12", "Chapter 13", "Chapter 14", "Chapter 15", "Chapter 16", "Chapter 17", "Chapter 18", "Chapter 19", "Chapter 20", "Chapter 21", "Chapter 22"]
    var n2array = ["Chapter 1", "Chapter 2", "Chapter 3", "Chapter 4", "Chapter 5", "Chapter 6", "Chapter 7", "Chapter 8", "Chapter 9", "Chapter 10", "Chapter 11", "Chapter 12", "Chapter 13", "Chapter 14", "Chapter 15", "Chapter 16", "Chapter 17", "Chapter 18", "Chapter 19", "Chapter 20", "Chapter 21", "Chapter 22", "Chapter 23", "Chapter 24", "Chapter 25"]
    var n3array = ["Chapter 1","Chapter 2","Chapter 3","Chapter 4","Chapter 5","Chapter 6","Chapter 7","Chapter 8","Chapter 9","Chapter 10","Chapter 11","Chapter 12","Chapter 13","Chapter 14","Chapter 15","Chapter 16","Chapter 17","Chapter 18","Chapter 19","Chapter 20","Chapter 21","Chapter 22","Chapter 23","Chapter 24","Chapter 25","Chapter 26","Chapter 27","Chapter 28","Chapter 29","Chapter 30"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "ChapterTableViewCell", bundle: nil)
        chapterTableView.register(nib, forCellReuseIdentifier: "ChapterCell")
        
        chapterTableView.separatorStyle = .none
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 下側の二つの角を角丸にする
        greenView.layer.cornerRadius = 25
        greenView.clipsToBounds = true
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        //画面が読み込まれた時に表示するラベル
        if LEVEL as! Int == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            descriptionLabel.text = "Kanji Vocabulary words that appear in the JLPT N1 exam."
            messageLabel.text = "If you’re discussing current issues, or topics that interest you, then you will likely end up using N1 vocabulary...👀"
        }
        else if LEVEL as! Int == 1 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            descriptionLabel.text = "Kanji Vocabulary words that appear in the JLPT N2 exam."
            messageLabel.text = "N2 is about the minimum level you should have if you will be using Japanese in your job 💼"
        }
        else if LEVEL as! Int == 2 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            descriptionLabel.text = "Kanji Vocabulary words that appear in the JLPT N3 exam."
            messageLabel.text = "If you pass N3, you have met one of the requirements to be able to work or get a scholarship in Japan! 🎓"
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if LEVEL as! Int == 0 {
            return n1array.count
        }
        else if LEVEL as! Int == 1 {
            return n2array.count
        }
        else if LEVEL as! Int == 2 {
            return n3array.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterTableViewCell
        
        if LEVEL as! Int == 0 {
            cell.chapterLabel!.text = n1array[indexPath.row]
        } else if LEVEL as! Int == 1 {
            cell.chapterLabel!.text = n2array[indexPath.row]
        } else if LEVEL as! Int == 2 {
            cell.chapterLabel!.text = n3array[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "CHAPTER")
        
        performSegue(withIdentifier: "toVocabInputView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
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
