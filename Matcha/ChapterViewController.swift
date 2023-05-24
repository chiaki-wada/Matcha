//
//  ChapterViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/24.
//

import UIKit

let saveData = UserDefaults.standard

class ChapterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    var LEVEL = saveData.object(forKey:"LEVEL")
    
    var n1array = ["Chapter 1","Chapter 2","Chapter 3","Chapter 4"]
    var n2array = ["Chapter 1","Chapter 2","Chapter 3"]
    var n3array = ["Chapter 1","Chapter 2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if LEVEL as! Int == 0 {
            return n1array.count
        }
        if LEVEL as! Int == 1 {
            return n2array.count
        }
        if LEVEL as! Int == 2 {
            return n3array.count
        }
        return n3array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath)
        //セルに表示する値を設定する
        if LEVEL as! Int == 0 {
            cell.textLabel!.text = n1array[indexPath.row]
            return cell
        }
        cell.textLabel!.text = n2array[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //画面が読み込まれた時に表示するラベル
        if LEVEL as! Int == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            descriptionLabel.text = "Kanji Vocabulary words that appear in the JLPT N1 exam."
            messageLabel.text = ""
        }
        else if LEVEL as! Int == 0 {
            titleLabel.text = "JLPT N2 Vocabulary"
            descriptionLabel.text = "Kanji Vocabulary words that appear in the JLPT N2 exam."
            messageLabel.text = ""
        }
        else if LEVEL as! Int == 0 {
            titleLabel.text = "JLPT N3 Vocabulary"
            descriptionLabel.text = "Kanji Vocabulary words that appear in the JLPT N2 exam."
            messageLabel.text = ""
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
