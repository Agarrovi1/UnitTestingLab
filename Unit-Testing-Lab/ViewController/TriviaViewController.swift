//
//  TriviaViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var triviaTableView: UITableView!
    var questions = [TriviaInfo]() {
        didSet{
            triviaTableView.reloadData()
        }
    }
    
    func loadData() {
        guard let pathToTrivia = Bundle.main.path(forResource: "trivia", ofType: "json") else {return}
        let url = URL(fileURLWithPath: pathToTrivia)
        do {
            let data = try Data(contentsOf: url)
            let triviaQuestions = try Trivia.getTrivias(from: data)
            questions = triviaQuestions
        } catch let jsonError {
            print(jsonError)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        triviaTableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TriviaDetailViewController, let indexPath = triviaTableView.indexPathForSelectedRow else {return}
        destination.triviaQuestion = questions[indexPath.row]
    }
}
extension TriviaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = triviaTableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        let triv = questions[indexPath.row]
        cell.textLabel?.text = triv.takePercentFromQuestion()
        return cell
    }
    
    
}
