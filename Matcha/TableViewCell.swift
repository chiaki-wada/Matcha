//
//  TableViewCell.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/26.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var wordsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
