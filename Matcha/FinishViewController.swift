//
//  FinishViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/28.
//

import UIKit

class FinishViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func tapSelectChapterButton(){
        
        let index = navigationController!.viewControllers.count - 5
        navigationController?.popToViewController(navigationController!.viewControllers[index], animated: true)
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
