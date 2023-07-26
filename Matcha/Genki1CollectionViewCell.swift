//
//  Genki1CollectionViewCell.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/25.
//

import UIKit

class Genki1CollectionViewCell: UICollectionViewCell {

    @IBOutlet var lessonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // セルを角丸にする
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }

}
