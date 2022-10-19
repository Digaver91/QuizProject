//
//  QuizTableViewCell.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    var question: Question?
//    var answers = [Answer]()
    //var secAnsw: SecondaryAnswer?
    
    var didButtonTapped: ((Question?) -> Void)?

    
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
    
    
    @IBAction func firstButtonPressed(_ sender: Any) {
        firstAnswerButton.backgroundColor = .orange
        
        if firstAnswerButton.backgroundColor == .orange {
            question?.answers[0].isChecked = true
            
            secondAnswerButton.isEnabled = false
            thirdAnswerButton.isEnabled = false
            
            question?.isCorrectChoise = question?.answers[0].isRightVariant ?? false
            didButtonTapped?(question)
        }
    }
    
    @IBAction func secondButtonPressed(_ sender: Any) {
        secondAnswerButton.backgroundColor = .orange
        
        if secondAnswerButton.backgroundColor == .orange {
            question?.answers[1].isChecked = true
            firstAnswerButton.isEnabled = false
            thirdAnswerButton.isEnabled = false
            
            question?.isCorrectChoise = question!.answers[1].isRightVariant
            didButtonTapped?(question)
        }
    }
    
    
    @IBAction func thirdButtonPressed(_ sender: Any) {
        thirdAnswerButton.backgroundColor = .orange
        
        if thirdAnswerButton.backgroundColor == .orange {
            question?.answers[2].isChecked = true
            firstAnswerButton.isEnabled = false
            secondAnswerButton.isEnabled = false
            
            question?.isCorrectChoise = question?.answers[2].isRightVariant ?? false
            didButtonTapped?(question)
        }
    }
 
}
