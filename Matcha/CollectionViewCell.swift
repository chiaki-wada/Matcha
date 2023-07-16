//
//  CollectionViewCell.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/11.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var levelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // セルを角丸にする
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }

}
