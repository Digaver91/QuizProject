//
//  ViewController.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 14.10.2022.
//

import UIKit

class ViewController: UIViewController {
    // rename viewcontroller
    
    var players = [Player]()
    var questions = [Question]()
    

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
        questions.append(Question(question: "What is the biggest planet in our system?", answers: [
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: false, isChecked: false),
        Answer(name: "Earth", isRightVariant: false, isChecked: false),
        Answer(name: "Earth", isRightVariant: false, isChecked: false)
       
        ]))
        questions.append(Question(question: "What is the biggest planet in our system2?", answers: [
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false)
       
        ]))
        questions.append(Question(question: "What is the biggest planet in our system3?", answers: [
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false)
       
        ]))
        questions.append(Question(question: "What is the biggest planet in our system4?", answers: [
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false),
        Answer(name: "Earth", isRightVariant: true, isChecked: false)
       
        ]))
//        questions.append(Question(question: "What is the biggest planet in our system?"))
//        questions.append(Question(question: "What is the closest planet to the sun?"))
//        questions.append(Question(question: "How many planets are in the Solar System?"))
//        questions.append(Question(question: "Which planet has the largest ring system?"))
//        questions.append(Question(question: "What is the smallest planet?"))
    }
    
    func addAnswers() {
//        answers.append(Answer(firstAnswer: SecondaryAnswer(name: "Earth", isRightVariant: false, isChecked: false), secondAnswer: SecondaryAnswer(name: "Mars", isRightVariant: false, isChecked: false), correctAnswer: SecondaryAnswer(name: "Jupiter", isRightVariant: true, isChecked: false)))
//        answers.append(Answer(firstAnswer: SecondaryAnswer(name: "Neptune", isRightVariant: false, isChecked: false), secondAnswer: SecondaryAnswer(name: "Pluto", isRightVariant: false, isChecked: false), correctAnswer: SecondaryAnswer(name: "Mercury", isRightVariant: true, isChecked: false)))
//        answers.append(Answer(firstAnswer: SecondaryAnswer(name: "7", isRightVariant: false, isChecked: false), secondAnswer: SecondaryAnswer(name: "10", isRightVariant: false, isChecked: false), correctAnswer: SecondaryAnswer(name: "8", isRightVariant: true, isChecked: false)))
//        answers.append(Answer(firstAnswer: SecondaryAnswer(name: "Jupiter", isRightVariant: false, isChecked: false), secondAnswer: SecondaryAnswer(name: "Mercury", isRightVariant: false, isChecked: false), correctAnswer: SecondaryAnswer(name: "Saturn", isRightVariant: true, isChecked: false)))
//        answers.append(Answer(firstAnswer: SecondaryAnswer(name: "Venus", isRightVariant: false, isChecked: false), secondAnswer: SecondaryAnswer(name: "Earth", isRightVariant: false, isChecked: false), correctAnswer: SecondaryAnswer(name: "Pluto", isRightVariant: true, isChecked: false)))
    }

    @IBAction func submitButton(_ sender: Any) {
        players.append(Player(name: nameTextField.text ?? ""))
        tableView.reloadData()
    }
    
    @IBAction func startQuizButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {return}
        vc.questions = questions
        vc.player = players[0]
        vc.delegate = self
        show(vc, sender: nil)
    }
    
}
extension ViewController: QuizViewControllerDelegate {
    func submit(score: Int) {
        players[0].score = score
        tableView.reloadData()
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
