//
//  QuizTableViewCell.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    
    @IBOutlet weak var secondAnswerButton: UIButton!
    
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func nextQuestionButton(_ sender: Any) {
        
        thirdAnswerButton.backgroundColor = .green
        nextButton.isEnabled = false
    }
}
