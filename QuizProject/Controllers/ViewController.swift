//
//  ViewController.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 14.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var players = [Player]()
    var questions = [Question]()
    var answers = [Answer]()

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addQuestion()
        addAnswers()
        
        let image = UIImage(named: "space2")
            let imageView = UIImageView(image: image)
            tableView.backgroundView = imageView
            imageView.alpha = 0.8
        
    }
    
    func addQuestion() {
        questions.append(Question(question: "What is the biggest planet in our system?"))
        questions.append(Question(question: "What is the closest planet to the sun?"))
        questions.append(Question(question: "How many planets are in the Solar System?"))
        questions.append(Question(question: "Which planet has the largest ring system?"))
        questions.append(Question(question: "What is the smallest planet?"))
    }
    
    func addAnswers() {
        answers.append(Answer(firstAnswer: "Earth", secondAnswer: "Mars", correctAnswer: "Jupiter"))
        answers.append(Answer(firstAnswer: "Neptune", secondAnswer: "Pluto", correctAnswer: "Mercury"))
        answers.append(Answer(firstAnswer: "7", secondAnswer: "10", correctAnswer: "8"))
        answers.append(Answer(firstAnswer: "Jupiter", secondAnswer: "Mercury", correctAnswer: "Saturn"))
        answers.append(Answer(firstAnswer: "Venus", secondAnswer: "Earth", correctAnswer: "Pluto"))
    }

    @IBAction func submitButton(_ sender: Any) {
        players.append(Player(name: nameTextField.text ?? ""))
        tableView.reloadData()
    }
    
    @IBAction func startQuizButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {return}
        vc.questions = questions
        vc.answers = answers
        show(vc, sender: nil)
    }
}
extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ratingCell", for: indexPath) as? RatingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.playerNameLabel.text = players[indexPath.row].name
        return cell
    }
    
    
}
