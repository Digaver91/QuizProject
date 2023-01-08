//
//  QuizTableViewCell.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    var question: Question? {
        didSet {
            for button in buttons {
                button.setTitle("\(question?.answers[button.tag].name ?? "")", for: .normal)
            }
        }
    }

    
    var didButtonTapped: ((Question?) -> Void)?

    
    @IBOutlet var buttons: [UIButton]!
   
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        buttons.forEach { $0.isEnabled = false }
        sender.backgroundColor = .orange
        question?.answers[sender.tag].isChecked = true

        if let answer = question?.answers[sender.tag] {
            question?.isCorrectChoise = answer.isRightVariant
            didButtonTapped?(question)
        }
    }
}
