//
//  ViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var logoImageView: UIImageView!
    var levelArray = ["N1","N2","N3"]
    var wordsArray = ["100 words", "200 words","300 words"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "LevelCell")
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 90
        tableView.sectionHeaderHeight = 20
        tableView.sectionFooterHeight = 20
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath) as! TableViewCell
        cell.levelLabel.text = levelArray[indexPath.row]
        cell.wordsLabel.text = wordsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "LEVEL")
        
        let chapterVC = storyboard?.instantiateViewController(withIdentifier: "ChapterViewController") as! ChapterViewController
        chapterVC.LEVEL = indexPath.row
        navigationController?.pushViewController(chapterVC, animated: true)
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
        return 90
    }
    
    
}
