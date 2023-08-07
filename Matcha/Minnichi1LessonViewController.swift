//
//  Minnichi1LessonViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/29.
//

import UIKit

class Minnichi1LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterTableView: UITableView!
    
    var MINNICHI1 = saveData.object(forKey:"MINNICHI1")
    
    var minnichi1L1array = ["1〜10","11〜20","21〜30","31〜40"]
    var minnichi1L2array = ["1〜10","11〜20","21〜30","31〜40","41〜45"]
    var minnichi1L3array = ["1〜10","11〜20","21〜30","31〜40","41〜44"]
    var minnichi1L4array = ["1〜10","11〜20","21〜30","31〜40","41〜49"]
    var minnichi1L5array = ["1〜10","11〜20","21〜30","31〜42"]
    var minnichi1L6array = ["1〜10","11〜20","21〜30","31〜40","41〜50","51〜53"]
    var minnichi1L7array = ["1〜10","11〜20","21〜30","31〜40","41〜47"]
    var minnichi1L8array = ["1〜10","11〜20","21〜30","31〜40","41〜50","51〜54"]
    var minnichi1L9array = ["1〜10","11〜20","21〜30","31〜40","41〜51"]
    var minnichi1L10array = ["1〜10","11〜20","21〜30","31〜40","41〜44"]
    var minnichi1L11array = ["1〜10","11〜20","21〜30","31〜40","41〜46"]
    var minnichi1L12array = ["1〜10","11〜20","21〜30","31〜40","41〜44"]
    var minnichi1L13array = ["1〜10","11〜20","21〜30","31〜39"]
    var minnichi1L14array = ["1〜10","11〜20","21〜32"]
    var minnichi1L15array = ["1〜10","11〜20","21〜24"]
    var minnichi1L16array = ["1〜10","11〜20","21〜30","31〜40","41〜48"]
    var minnichi1L17array = ["1〜10","11〜20","21〜30","31〜36"]
    var minnichi1L18array = ["1〜10","11〜20","21〜26"]
    var minnichi1L19array = ["1〜10","11〜20","21〜29"]
    var minnichi1L20array = ["1〜10","11〜20","21〜26"]
    var minnichi1L21array = ["1〜10","11〜20","21〜32"]
    var minnichi1L22array = ["1〜10","11〜16"]
    var minnichi1L23array = ["1〜10","11〜20","21〜29"]
    var minnichi1L24array = ["1〜10","11〜20"]
    var minnichi1L25array = ["1〜10","11〜14"]
    
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
        if MINNICHI1 as! Int == 0 {
            titleLabel.text = "第1課"
            titleShadowLabel.text = "第1課"
        } else if MINNICHI1 as! Int == 1 {
            titleLabel.text = "第2課"
            titleShadowLabel.text = "第2課"
        }
        else if MINNICHI1 as! Int == 2 {
            titleLabel.text = "第3課"
            titleShadowLabel.text = "第3課"
        }
        else if MINNICHI1 as! Int == 3 {
            titleLabel.text = "第4課"
            titleShadowLabel.text = "第4課"
        }
        else if MINNICHI1 as! Int == 4 {
            titleLabel.text = " 第5課"
            titleShadowLabel.text = "第5課"
        }
        else if MINNICHI1 as! Int == 5 {
            titleLabel.text = " 第6課"
            titleShadowLabel.text = "第6課"
        }
        else if MINNICHI1 as! Int == 6 {
            titleLabel.text = "第7課"
            titleShadowLabel.text = "第7課"
        }
        else if MINNICHI1 as! Int == 7 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
        }
        else if MINNICHI1 as! Int == 8 {
            titleLabel.text = "第9課"
            titleShadowLabel.text = "第9課"
        }
        else if MINNICHI1 as! Int == 9 {
            titleLabel.text = "第10課"
            titleShadowLabel.text = " 第10課"
        }
        else if MINNICHI1 as! Int == 10 {
            titleLabel.text = "第11課"
            titleShadowLabel.text = "第11課"
        }
        else if MINNICHI1 as! Int == 11 {
            titleLabel.text = "第12課"
            titleShadowLabel.text = "第12課"
        }
        else if MINNICHI1 as! Int == 12 {
            titleLabel.text = "第13課"
            titleShadowLabel.text = "第13課"
        }
        else if MINNICHI1 as! Int == 13 {
            titleLabel.text = "第14課"
            titleShadowLabel.text = "第14課"
        }
        else if MINNICHI1 as! Int == 14 {
            titleLabel.text = "第15課"
            titleShadowLabel.text = "第15課"
        }
        else if MINNICHI1 as! Int == 15 {
            titleLabel.text = "第16課"
            titleShadowLabel.text = "第16課"
        }
        else if MINNICHI1 as! Int == 16 {
            titleLabel.text = "第17課"
            titleShadowLabel.text = "第17課"
        }
        else if MINNICHI1 as! Int == 17 {
            titleLabel.text = "第18課"
            titleShadowLabel.text = "第18課"
        }
        else if MINNICHI1 as! Int == 18 {
            titleLabel.text = "第19課"
            titleShadowLabel.text = "第19課"
        }
        else if MINNICHI1 as! Int == 19 {
            titleLabel.text = "第20課"
            titleShadowLabel.text = "第20課"
        }
        else if MINNICHI1 as! Int == 20 {
            titleLabel.text = "第21課"
            titleShadowLabel.text = "第21課"
        }
        else if MINNICHI1 as! Int == 21 {
            titleLabel.text = "第22課"
            titleShadowLabel.text = "第22課"
        }
        else if MINNICHI1 as! Int == 22 {
            titleLabel.text = "第23課"
            titleShadowLabel.text = "第23課"
        }
        else if MINNICHI1 as! Int == 23 {
            titleLabel.text = "第24課"
            titleShadowLabel.text = "第24課"
        }
        else if MINNICHI1 as! Int == 24 {
            titleLabel.text = "第25課"
            titleShadowLabel.text = "第25課"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MINNICHI1 as! Int == 0 {
            return minnichi1L1array.count
        }
        else if MINNICHI1 as! Int == 1 {
            return minnichi1L2array.count
        }
        else if MINNICHI1 as! Int == 2 {
            return minnichi1L3array.count
        }
        else if MINNICHI1 as! Int == 3 {
            return minnichi1L4array.count
        }
        else if MINNICHI1 as! Int == 4 {
            return minnichi1L5array.count
        }
        else if MINNICHI1 as! Int == 5 {
            return minnichi1L6array.count
        }
        else if MINNICHI1 as! Int == 6 {
            return minnichi1L7array.count
        }
        else if MINNICHI1 as! Int == 7 {
            return minnichi1L8array.count
        }
        else if MINNICHI1 as! Int == 8 {
            return minnichi1L9array.count
        }
        else if MINNICHI1 as! Int == 9 {
            return minnichi1L10array.count
        }
        else if MINNICHI1 as! Int == 10 {
            return minnichi1L11array.count
        }
        else if MINNICHI1 as! Int == 11 {
            return minnichi1L12array.count
        }
        else if MINNICHI1 as! Int == 12 {
            return minnichi1L13array.count
        }
        else if MINNICHI1 as! Int == 13 {
            return minnichi1L14array.count
        }
        else if MINNICHI1 as! Int == 14 {
            return minnichi1L15array.count
        }
        else if MINNICHI1 as! Int == 15 {
            return minnichi1L16array.count
        }
        else if MINNICHI1 as! Int == 16 {
            return minnichi1L17array.count
        }
        else if MINNICHI1 as! Int == 17 {
            return minnichi1L18array.count
        }
        else if MINNICHI1 as! Int == 18 {
            return minnichi1L19array.count
        }
        else if MINNICHI1 as! Int == 19 {
            return minnichi1L20array.count
        }
        else if MINNICHI1 as! Int == 20 {
            return minnichi1L21array.count
        }
        else if MINNICHI1 as! Int == 21 {
            return minnichi1L22array.count
        }
        else if MINNICHI1 as! Int == 22 {
            return minnichi1L23array.count
        }
        else if MINNICHI1 as! Int == 23 {
            return minnichi1L24array.count
        }
        else if MINNICHI1 as! Int == 24 {
            return minnichi1L25array.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterTableViewCell
        
        if MINNICHI1 as! Int == 0 {
            cell.chapterLabel!.text = minnichi1L1array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 1 {
            cell.chapterLabel!.text = minnichi1L2array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 2 {
            cell.chapterLabel!.text = minnichi1L3array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 3 {
            cell.chapterLabel!.text = minnichi1L4array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 4 {
            cell.chapterLabel!.text = minnichi1L5array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 5 {
            cell.chapterLabel!.text = minnichi1L6array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 6 {
            cell.chapterLabel!.text = minnichi1L7array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 7 {
            cell.chapterLabel!.text = minnichi1L8array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 8 {
            cell.chapterLabel!.text = minnichi1L9array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 9 {
            cell.chapterLabel!.text = minnichi1L10array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 10 {
            cell.chapterLabel!.text = minnichi1L11array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 11 {
            cell.chapterLabel!.text = minnichi1L12array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 12 {
            cell.chapterLabel!.text = minnichi1L13array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 13 {
            cell.chapterLabel!.text = minnichi1L14array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 14 {
            cell.chapterLabel!.text = minnichi1L15array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 15 {
            cell.chapterLabel!.text = minnichi1L16array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 16 {
            cell.chapterLabel!.text = minnichi1L17array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 17 {
            cell.chapterLabel!.text = minnichi1L18array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 18 {
            cell.chapterLabel!.text = minnichi1L19array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 19 {
            cell.chapterLabel!.text = minnichi1L20array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 20 {
            cell.chapterLabel!.text = minnichi1L21array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 21 {
            cell.chapterLabel!.text = minnichi1L22array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 22 {
            cell.chapterLabel!.text = minnichi1L23array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 23 {
            cell.chapterLabel!.text = minnichi1L24array[indexPath.row]
        }
        else if MINNICHI1 as! Int == 24 {
            cell.chapterLabel!.text = minnichi1L25array[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "CHAPTER")
        
        performSegue(withIdentifier: "toMinnichi1VocabInputView", sender: nil)
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
