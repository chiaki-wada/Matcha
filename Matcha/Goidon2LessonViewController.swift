//
//  Goidon2LessonViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/14.
//

import UIKit

class Goidon2LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterTableView: UITableView!
    
    var GOIDON2 = saveData.object(forKey:"GOIDON2")
    
    var goidon2L1array = ["601〜610","611〜620","621〜630"]
    var goidon2L2array = ["631〜640","641〜650","651〜660"]
    var goidon2L3array = ["661〜670","671〜680","681〜690"]
    var goidon2L4array = ["691〜700","701〜710","711〜720"]
    var goidon2L5array = ["721〜730","731〜740","741〜750"]
    var goidon2L6array = ["751〜760","761〜770","771〜780"]
    var goidon2L7array = ["781〜790","791〜800","801〜810"]
    var goidon2L8array = ["811〜820","821〜830","831〜840"]
    var goidon2L9array = ["841〜850","851〜860","861〜870"]
    var goidon2L10array = ["871〜880","881〜890","891〜900"]
    var goidon2L11array = ["901〜910","911〜920","921〜930"]
    var goidon2L12array = ["931〜940","941〜950","951〜960"]
    var goidon2L13array = ["961〜970","971〜980","981〜990"]
    var goidon2L14array = ["991〜1000","1001〜1010","1011〜1020"]
    var goidon2L15array = ["1021〜1030","1031〜1040","1041〜1050"]
    var goidon2L16array = ["1051〜1060","1061〜1070","1071〜1080"]
    var goidon2L17array = ["1081〜1090","1091〜1100","1101〜1110"]
    var goidon2L18array = ["1111〜1120","1121〜1130","1131〜1140"]
    var goidon2L19array = ["1141〜1150","1151〜1160","1161〜1170"]
    var goidon2L20array = ["1171〜1180","1181〜1190","1191〜1200"]
    var goidon2thesisarray = ["Are you ready?"]

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
        if GOIDON2 as! Int == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
        } else if GOIDON2 as! Int == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
        }
        else if GOIDON2 as! Int == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
        }
        else if GOIDON2 as! Int == 3 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
        }
        else if GOIDON2 as! Int == 4 {
            titleLabel.text = " Lesson 5"
            titleShadowLabel.text = "Lesson 5"
        }
        else if GOIDON2 as! Int == 5 {
            titleLabel.text = " Lesson 6"
            titleShadowLabel.text = "Lesson 6"
        }
        else if GOIDON2 as! Int == 6 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
        }
        else if GOIDON2 as! Int == 7 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
        }
        else if GOIDON2 as! Int == 8 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
        }
        else if GOIDON2 as! Int == 9 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = " Lesson 10"
        }
        else if GOIDON2 as! Int == 10 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
        }
        else if GOIDON2 as! Int == 11 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
        }
        else if GOIDON2 as! Int == 12 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
        }
        else if GOIDON2 as! Int == 13 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
        }
        else if GOIDON2 as! Int == 14 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
        }
        else if GOIDON2 as! Int == 15 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
        }
        else if GOIDON2 as! Int == 16 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
        }
        else if GOIDON2 as! Int == 17 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
        }
        else if GOIDON2 as! Int == 18 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
        }
        else if GOIDON2 as! Int == 19 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
        }
        else if GOIDON2 as! Int == 20 {
            titleLabel.text = "Used for My Thesis"
            titleShadowLabel.text = "Used for My Thesis"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GOIDON2 as! Int == 0 {
            return goidon2L1array.count
        }
        else if GOIDON2 as! Int == 1 {
            return goidon2L2array.count
        }
        else if GOIDON2 as! Int == 2 {
            return goidon2L3array.count
        }
        else if GOIDON2 as! Int == 3 {
            return goidon2L4array.count
        }
        else if GOIDON2 as! Int == 4 {
            return goidon2L5array.count
        }
        else if GOIDON2 as! Int == 5 {
            return goidon2L6array.count
        }
        else if GOIDON2 as! Int == 6 {
            return goidon2L7array.count
        }
        else if GOIDON2 as! Int == 7 {
            return goidon2L8array.count
        }
        else if GOIDON2 as! Int == 8 {
            return goidon2L9array.count
        }
        else if GOIDON2 as! Int == 9 {
            return goidon2L10array.count
        }
        else if GOIDON2 as! Int == 10 {
            return goidon2L11array.count
        }
        else if GOIDON2 as! Int == 11 {
            return goidon2L12array.count
        }
        else if GOIDON2 as! Int == 12 {
            return goidon2L13array.count
        }
        else if GOIDON2 as! Int == 13 {
            return goidon2L14array.count
        }
        else if GOIDON2 as! Int == 14 {
            return goidon2L15array.count
        }
        else if GOIDON2 as! Int == 15 {
            return goidon2L16array.count
        }
        else if GOIDON2 as! Int == 16 {
            return goidon2L17array.count
        }
        else if GOIDON2 as! Int == 17 {
            return goidon2L18array.count
        }
        else if GOIDON2 as! Int == 18 {
            return goidon2L19array.count
        }
        else if GOIDON2 as! Int == 19 {
            return goidon2L20array.count
        }
        else if GOIDON2 as! Int == 20 {
            return goidon2thesisarray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterTableViewCell
        
        if GOIDON2 as! Int == 0 {
            cell.chapterLabel!.text = goidon2L1array[indexPath.row]
        }
        else if GOIDON2 as! Int == 1 {
            cell.chapterLabel!.text = goidon2L2array[indexPath.row]
        }
        else if GOIDON2 as! Int == 2 {
            cell.chapterLabel!.text = goidon2L3array[indexPath.row]
        }
        else if GOIDON2 as! Int == 3 {
            cell.chapterLabel!.text = goidon2L4array[indexPath.row]
        }
        else if GOIDON2 as! Int == 4 {
            cell.chapterLabel!.text = goidon2L5array[indexPath.row]
        }
        else if GOIDON2 as! Int == 5 {
            cell.chapterLabel!.text = goidon2L6array[indexPath.row]
        }
        else if GOIDON2 as! Int == 6 {
            cell.chapterLabel!.text = goidon2L7array[indexPath.row]
        }
        else if GOIDON2 as! Int == 7 {
            cell.chapterLabel!.text = goidon2L8array[indexPath.row]
        }
        else if GOIDON2 as! Int == 8 {
            cell.chapterLabel!.text = goidon2L9array[indexPath.row]
        }
        else if GOIDON2 as! Int == 9 {
            cell.chapterLabel!.text = goidon2L10array[indexPath.row]
        }
        else if GOIDON2 as! Int == 10 {
            cell.chapterLabel!.text = goidon2L11array[indexPath.row]
        }
        else if GOIDON2 as! Int == 11 {
            cell.chapterLabel!.text = goidon2L12array[indexPath.row]
        }
        else if GOIDON2 as! Int == 12 {
            cell.chapterLabel!.text = goidon2L13array[indexPath.row]
        }
        else if GOIDON2 as! Int == 13 {
            cell.chapterLabel!.text = goidon2L14array[indexPath.row]
        }
        else if GOIDON2 as! Int == 14 {
            cell.chapterLabel!.text = goidon2L15array[indexPath.row]
        }
        else if GOIDON2 as! Int == 15 {
            cell.chapterLabel!.text = goidon2L16array[indexPath.row]
        }
        else if GOIDON2 as! Int == 16 {
            cell.chapterLabel!.text = goidon2L17array[indexPath.row]
        }
        else if GOIDON2 as! Int == 17 {
            cell.chapterLabel!.text = goidon2L18array[indexPath.row]
        }
        else if GOIDON2 as! Int == 18 {
            cell.chapterLabel!.text = goidon2L19array[indexPath.row]
        }
        else if GOIDON2 as! Int == 19 {
            cell.chapterLabel!.text = goidon2L20array[indexPath.row]
        }
        else if GOIDON2 as! Int == 20 {
            cell.chapterLabel!.text = goidon2thesisarray[indexPath.row]
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "CHAPTER")
        
        performSegue(withIdentifier: "toGoidon2VocabInputView", sender: nil)
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
    
}
