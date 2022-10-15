//
//  ViewController.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 14.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var players = [Player]()

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func submitButton(_ sender: Any) {
        players.append(Player(name: nameTextField.text ?? ""))
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
