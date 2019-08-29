//
//  StarWarsViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    var starWarsEps = [Results]() {
        didSet{
            movieTableView.reloadData()
        }
    }
    
    @IBOutlet weak var movieTableView: UITableView!
    
    private func loadData() {
        guard let pathToStarWars = Bundle.main.path(forResource: "starWars", ofType: "json") else {return}
        let url = URL(fileURLWithPath: pathToStarWars)
        do {
            let data = try Data(contentsOf: url)
            let starWars = StarWars.getEpisodes(from: data)
            starWarsEps = starWars
        } catch {
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        movieTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? StarWarsDetailViewController, let indexPath = movieTableView.indexPathForSelectedRow else {return}
        destination.movie = starWarsEps[indexPath.row]
    }

}

extension StarWarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsEps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "starWarCell", for: indexPath)
        let movie = starWarsEps[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }
    
    
}
