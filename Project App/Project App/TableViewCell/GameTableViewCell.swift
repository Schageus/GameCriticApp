//
//  GameTableViewCell.swift
//  Project App
//
//  Created by Adrian Schlegel on 21.03.22.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    
    override func awakeFromNib() {
        
        // Initializes code
        
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        // Configure views for selected states
        
        super.setSelected(selected, animated: animated)
    }
}
