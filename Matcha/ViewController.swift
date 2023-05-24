//
//  ViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = ["JLPT N1","JLPT N2","JLPT N3","JLPT N4","JLPT N5"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    //TableViewのどのセルにarrayを表示させるか
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath)
        //セルに表示する値を設定する
        cell.textLabel!.text = array[indexPath.row]
        return cell
    }
    
    //セルがタップされた時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let saveData = UserDefaults.standard
        saveData.set(indexPath.row, forKey: "LEVEL")
        self.performSegue(withIdentifier: "toChapterView", sender: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

