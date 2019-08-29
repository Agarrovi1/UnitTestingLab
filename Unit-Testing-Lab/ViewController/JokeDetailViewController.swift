//
//  JokeDetailViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {
    @IBOutlet weak var punchlineLabel: UILabel!
    
    var joke: Jokes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let joke = joke else {return}
        punchlineLabel.text = joke.punchline
        // Do any additional setup after loading the view.
    }
    

}
