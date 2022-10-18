//
//  QuizViewController.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var players = [Player]()
    var questions = [Question]()
    var answers = [Answer]()
    var secAnsw = [SecondaryAnswer]()
    
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
        
        cell.firstAnswerButton.setTitle("\(answers[indexPath.row].firstAnswer.name)", for: .normal)
        cell.secondAnswerButton.setTitle("\(answers[indexPath.row].secondAnswer.name)", for: .normal)
        cell.thirdAnswerButton.setTitle("\(answers[indexPath.row].correctAnswer.name)", for: .normal)
        
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
