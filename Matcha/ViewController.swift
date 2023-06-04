//
//  ViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var logoImageView: UIImageView!
    var levelArray = ["N1","N2","N3"]
    var wordsArray = ["100 words", "200 words","300 words"]
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "LevelCell")
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.rowHeight = UITableView.automaticDimension // セルの高さを自動調整する
        tableView.estimatedRowHeight = 200 // セルの高さの推定値

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
    
    //セルがタップされた時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "LEVEL")
            
    }
    
    
    
}

