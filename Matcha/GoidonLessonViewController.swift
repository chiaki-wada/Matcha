//
//  GoidonLessonViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/13.
//

import UIKit

class GoidonLessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterTableView: UITableView!
    
    var GOIDON1 = saveData.object(forKey:"GOIDON1")
    
    var goidon1L1array = ["1〜10","11〜20","21〜30"]
    var goidon1L2array = ["31〜40","41〜50","51〜60"]
    var goidon1L3array = ["61〜70","71〜80","81〜90"]
    var goidon1L4array = ["91〜100","101〜110","111〜120"]
    var goidon1L5array = ["121〜130","131〜140","141〜150"]
    var goidon1L6array = ["151〜160","161〜170","171〜180"]
    var goidon1L7array = ["181〜190","191〜200","201〜210"]
    var goidon1L8array = ["211〜220","221〜230","231〜240"]
    var goidon1L9array = ["241〜250","251〜260","261〜270"]
    var goidon1L10array = ["271〜280","281〜290","291〜300"]
    var goidon1L11array = ["301〜310","311〜320","321〜330"]
    var goidon1L12array = ["331〜340","341〜350","351〜360"]
    var goidon1L13array = ["361〜370","371〜380","381〜390"]
    var goidon1L14array = ["391〜400","401〜410","411〜420"]
    var goidon1L15array = ["421〜430","431〜440","441〜450"]
    var goidon1L16array = ["451〜460","461〜470","471〜480"]
    var goidon1L17array = ["481〜490","491〜500","501〜510"]
    var goidon1L18array = ["511〜520","521〜530","531〜540"]
    var goidon1L19array = ["541〜550","551〜560","561〜570"]
    var goidon1L20array = ["571〜580","581〜590","591〜600"]
    
    
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
        if GOIDON1 as! Int == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
        } else if GOIDON1 as! Int == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
        }
        else if GOIDON1 as! Int == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
        }
        else if GOIDON1 as! Int == 3 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
        }
        else if GOIDON1 as! Int == 4 {
            titleLabel.text = " Lesson 5"
            titleShadowLabel.text = "Lesson 5"
        }
        else if GOIDON1 as! Int == 5 {
            titleLabel.text = " Lesson 6"
            titleShadowLabel.text = "Lesson 6"
        }
        else if GOIDON1 as! Int == 6 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
        }
        else if GOIDON1 as! Int == 7 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
        }
        else if GOIDON1 as! Int == 8 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
        }
        else if GOIDON1 as! Int == 9 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = " Lesson 10"
        }
        else if GOIDON1 as! Int == 10 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
        }
        else if GOIDON1 as! Int == 11 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
        }
        else if GOIDON1 as! Int == 12 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "esson 13"
        }
        else if GOIDON1 as! Int == 13 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
        }
        else if GOIDON1 as! Int == 14 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
        }
        else if GOIDON1 as! Int == 15 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
        }
        else if GOIDON1 as! Int == 16 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
        }
        else if GOIDON1 as! Int == 17 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
        }
        else if GOIDON1 as! Int == 18 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
        }
        else if GOIDON1 as! Int == 19 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GOIDON1 as! Int == 0 {
            return goidon1L1array.count
        }
        else if GOIDON1 as! Int == 1 {
            return goidon1L2array.count
        }
        else if GOIDON1 as! Int == 2 {
            return goidon1L3array.count
        }
        else if GOIDON1 as! Int == 3 {
            return goidon1L4array.count
        }
        else if GOIDON1 as! Int == 4 {
            return goidon1L5array.count
        }
        else if GOIDON1 as! Int == 5 {
            return goidon1L6array.count
        }
        else if GOIDON1 as! Int == 6 {
            return goidon1L7array.count
        }
        else if GOIDON1 as! Int == 7 {
            return goidon1L8array.count
        }
        else if GOIDON1 as! Int == 8 {
            return goidon1L9array.count
        }
        else if GOIDON1 as! Int == 9 {
            return goidon1L10array.count
        }
        else if GOIDON1 as! Int == 10 {
            return goidon1L11array.count
        }
        else if GOIDON1 as! Int == 11 {
            return goidon1L12array.count
        }
        else if GOIDON1 as! Int == 12 {
            return goidon1L13array.count
        }
        else if GOIDON1 as! Int == 13 {
            return goidon1L14array.count
        }
        else if GOIDON1 as! Int == 14 {
            return goidon1L15array.count
        }
        else if GOIDON1 as! Int == 15 {
            return goidon1L16array.count
        }
        else if GOIDON1 as! Int == 16 {
            return goidon1L17array.count
        }
        else if GOIDON1 as! Int == 17 {
            return goidon1L18array.count
        }
        else if GOIDON1 as! Int == 18 {
            return goidon1L19array.count
        }
        else if GOIDON1 as! Int == 19 {
            return goidon1L20array.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterTableViewCell
        
        if GOIDON1 as! Int == 0 {
            cell.chapterLabel!.text = goidon1L1array[indexPath.row]
        }
        else if GOIDON1 as! Int == 1 {
            cell.chapterLabel!.text = goidon1L2array[indexPath.row]
        }
        else if GOIDON1 as! Int == 2 {
            cell.chapterLabel!.text = goidon1L3array[indexPath.row]
        }
        else if GOIDON1 as! Int == 3 {
            cell.chapterLabel!.text = goidon1L4array[indexPath.row]
        }
        else if GOIDON1 as! Int == 4 {
            cell.chapterLabel!.text = goidon1L5array[indexPath.row]
        }
        else if GOIDON1 as! Int == 5 {
            cell.chapterLabel!.text = goidon1L6array[indexPath.row]
        }
        else if GOIDON1 as! Int == 6 {
            cell.chapterLabel!.text = goidon1L7array[indexPath.row]
        }
        else if GOIDON1 as! Int == 7 {
            cell.chapterLabel!.text = goidon1L8array[indexPath.row]
        }
        else if GOIDON1 as! Int == 8 {
            cell.chapterLabel!.text = goidon1L9array[indexPath.row]
        }
        else if GOIDON1 as! Int == 9 {
            cell.chapterLabel!.text = goidon1L10array[indexPath.row]
        }
        else if GOIDON1 as! Int == 10 {
            cell.chapterLabel!.text = goidon1L11array[indexPath.row]
        }
        else if GOIDON1 as! Int == 11 {
            cell.chapterLabel!.text = goidon1L12array[indexPath.row]
        }
        else if GOIDON1 as! Int == 12 {
            cell.chapterLabel!.text = goidon1L13array[indexPath.row]
        }
        else if GOIDON1 as! Int == 13 {
            cell.chapterLabel!.text = goidon1L14array[indexPath.row]
        }
        else if GOIDON1 as! Int == 14 {
            cell.chapterLabel!.text = goidon1L15array[indexPath.row]
        }
        else if GOIDON1 as! Int == 15 {
            cell.chapterLabel!.text = goidon1L16array[indexPath.row]
        }
        else if GOIDON1 as! Int == 16 {
            cell.chapterLabel!.text = goidon1L17array[indexPath.row]
        }
        else if GOIDON1 as! Int == 17 {
            cell.chapterLabel!.text = goidon1L18array[indexPath.row]
        }
        else if GOIDON1 as! Int == 18 {
            cell.chapterLabel!.text = goidon1L19array[indexPath.row]
        }
        else if GOIDON1 as! Int == 19 {
            cell.chapterLabel!.text = goidon1L20array[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "CHAPTER")
        
        performSegue(withIdentifier: "toGoidonVocabInputView", sender: nil)
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
