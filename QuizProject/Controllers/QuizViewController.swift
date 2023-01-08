//
//  QuizViewController.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import UIKit

protocol QuizViewControllerDelegate: AnyObject {
    func submit(score: Int)
}

class QuizViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var player: Player?
    var questions = [Question]()
 
    
    weak var delegate: QuizViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let image = UIImage(named: "space")
            let imageView = UIImageView(image: image)
            tableView.backgroundView = imageView
            imageView.alpha = 0.8
        
    }
    
    @IBAction func checkResultButton(_ sender: Any) {
       var score = 0
        questions.forEach { question in
            if let isCorrectChoise = question.isCorrectChoise, isCorrectChoise {
                score += 1
            }
        }
        delegate?.submit(score: score)
        dismiss(animated: true)
    }
}
extension QuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}
extension QuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as? QuizTableViewCell else {
            return UITableViewCell()
        }
        cell.questionLabel.text = questions[indexPath.row].question
        cell.question = questions[indexPath.row]
        
        cell.didButtonTapped = { question in
            self.questions[indexPath.row].isCorrectChoise = question?.isCorrectChoise
            self.questions[indexPath.row].answers = question?.answers ?? self.questions[indexPath.row].answers
            
            
        }
        return cell
    }
   
}
extension UITableView {
    @IBInspectable var backgroundImage: UIImage? {
        get {
            return nil
        }
        set {
            backgroundView = UIImageView(image: newValue)
        }
    }
}
