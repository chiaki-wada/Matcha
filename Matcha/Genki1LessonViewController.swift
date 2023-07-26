//
//  Genki1LessonViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/25.
//

import UIKit

class Genki1LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterTableView: UITableView!
    
    var GENKI1 = saveData.object(forKey:"GENKI1")
    
    var genki1L1array = ["1〜10","11〜20","21〜30","31〜40","41〜50","51〜58"]
    var genki1L2array = ["1〜10","11〜20","21〜30","31〜40","41〜45"]
    var genki1L3array = ["1〜10","11〜20","21〜30","31〜40","41〜47"]
    var genki1L4array = ["1〜10","11〜20","21〜30","31〜40","41〜50","51〜53"]
    var genki1L5array = ["1〜10","11〜20","21〜30","31〜40","41〜50"]
    var genki1L6array = ["1〜10","11〜20","21〜30","31〜40","41〜48"]
    var genki1L7array = ["1〜10","11〜20","21〜30","31〜40","41〜48"]
    var genki1L8array = ["1〜10","11〜20","21〜30","31〜40","41〜47"]
    var genki1L9array = ["1〜10","11〜20","21〜30","31〜40","41〜50"]
    var genki1L10array = ["1〜10","11〜20","21〜30","31〜40","41〜49"]
    var genki1L11array = ["1〜10","11〜20","21〜30","31〜40","41〜51"]
    var genki1L12array = ["1〜10","11〜20","21〜30","31〜40","41〜51"]
    
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
        if GENKI1 as! Int == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
        } else if GENKI1 as! Int == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
        }
        else if GENKI1 as! Int == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
        }
        else if GENKI1 as! Int == 3 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
        }
        else if GENKI1 as! Int == 4 {
            titleLabel.text = " Lesson 5"
            titleShadowLabel.text = "Lesson 5"
        }
        else if GENKI1 as! Int == 5 {
            titleLabel.text = " Lesson 6"
            titleShadowLabel.text = "Lesson 6"
        }
        else if GENKI1 as! Int == 6 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
        }
        else if GENKI1 as! Int == 7 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
        }
        else if GENKI1 as! Int == 8 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
        }
        else if GENKI1 as! Int == 9 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = " Lesson 10"
        }
        else if GENKI1 as! Int == 10 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
        }
        else if GENKI1 as! Int == 11 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GENKI1 as! Int == 0 {
            return genki1L1array.count
        }
        else if GENKI1 as! Int == 1 {
            return genki1L2array.count
        }
        else if GENKI1 as! Int == 2 {
            return genki1L3array.count
        }
        else if GENKI1 as! Int == 3 {
            return genki1L4array.count
        }
        else if GENKI1 as! Int == 4 {
            return genki1L5array.count
        }
        else if GENKI1 as! Int == 5 {
            return genki1L6array.count
        }
        else if GENKI1 as! Int == 6 {
            return genki1L7array.count
        }
        else if GENKI1 as! Int == 7 {
            return genki1L8array.count
        }
        else if GENKI1 as! Int == 8 {
            return genki1L9array.count
        }
        else if GENKI1 as! Int == 9 {
            return genki1L10array.count
        }
        else if GENKI1 as! Int == 10 {
            return genki1L11array.count
        }
        else if GENKI1 as! Int == 11 {
            return genki1L12array.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterTableViewCell
        
        if GENKI1 as! Int == 0 {
            cell.chapterLabel!.text = genki1L1array[indexPath.row]
        }
        else if GENKI1 as! Int == 1 {
            cell.chapterLabel!.text = genki1L2array[indexPath.row]
        }
        else if GENKI1 as! Int == 2 {
            cell.chapterLabel!.text = genki1L3array[indexPath.row]
        }
        else if GENKI1 as! Int == 3 {
            cell.chapterLabel!.text = genki1L4array[indexPath.row]
        }
        else if GENKI1 as! Int == 4 {
            cell.chapterLabel!.text = genki1L5array[indexPath.row]
        }
        else if GENKI1 as! Int == 5 {
            cell.chapterLabel!.text = genki1L6array[indexPath.row]
        }
        else if GENKI1 as! Int == 6 {
            cell.chapterLabel!.text = genki1L7array[indexPath.row]
        }
        else if GENKI1 as! Int == 7 {
            cell.chapterLabel!.text = genki1L8array[indexPath.row]
        }
        else if GENKI1 as! Int == 8 {
            cell.chapterLabel!.text = genki1L9array[indexPath.row]
        }
        else if GENKI1 as! Int == 9 {
            cell.chapterLabel!.text = genki1L10array[indexPath.row]
        }
        else if GENKI1 as! Int == 10 {
            cell.chapterLabel!.text = genki1L11array[indexPath.row]
        }
        else if GENKI1 as! Int == 11 {
            cell.chapterLabel!.text = genki1L12array[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "CHAPTER")
        
        performSegue(withIdentifier: "toGenki1VocabInputView", sender: nil)
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
