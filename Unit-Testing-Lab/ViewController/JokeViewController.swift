//
//  ViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    @IBOutlet weak var jokeTableView: UITableView!
    
    var jokes = [Jokes]() {
        didSet {
            jokeTableView.reloadData()
        }
    }
    
    private func getDataFromJokeJSON() {
        guard let pathToJokes = Bundle.main.path(forResource: "jokes", ofType: "json") else {return}
        let url = URL(fileURLWithPath: pathToJokes)
        do {
            let data = try Data(contentsOf: url)
            let jokesFromJSON = Jokes.getJokes(from: data)
            jokes = jokesFromJSON
        } catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTableView.dataSource = self
        getDataFromJokeJSON()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? JokeDetailViewController, let indexPath = jokeTableView.indexPathForSelectedRow else {return}
        destination.joke = jokes[indexPath.row]
    }

}
extension JokeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokeTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let joke = jokes[indexPath.row]
        cell.textLabel?.text = joke.setup
        return cell
    }
    
    
}
