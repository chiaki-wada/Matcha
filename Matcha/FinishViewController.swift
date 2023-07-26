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

}
