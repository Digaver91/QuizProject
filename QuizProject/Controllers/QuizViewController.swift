//
//  QuizViewController.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questions = [Question]()
    var answers = [Answer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let image = UIImage(named: "space")
            let imageView = UIImageView(image: image)
            tableView.backgroundView = imageView
            imageView.alpha = 0.8
        
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
        
        cell.firstAnswerButton.setTitle("\(answers[indexPath.row].firstAnswer)", for: .normal)
        cell.secondAnswerButton.setTitle("\(answers[indexPath.row].secondAnswer)", for: .normal)
        cell.thirdAnswerButton.setTitle("\(answers[indexPath.row].correctAnswer)", for: .normal)
  
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
