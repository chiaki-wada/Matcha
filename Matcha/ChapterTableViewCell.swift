//
//  ChapterTableViewCell.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/06/04.
//

import UIKit

class ChapterTableViewCell: UITableViewCell {
    
    @IBOutlet var chapterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
