//
//  QuestionTableViewCell.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 14.10.2022.
//

import UIKit

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
