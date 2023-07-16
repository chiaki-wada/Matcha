//
//  Goidon2CollectionViewCell.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/13.
//

import UIKit

class Goidon2CollectionViewCell: UICollectionViewCell {

    @IBOutlet var lessonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // セルを角丸にする
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }

}
