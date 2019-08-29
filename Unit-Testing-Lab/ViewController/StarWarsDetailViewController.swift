//
//  StarWarsDetailViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class StarWarsDetailViewController: UIViewController {
    
    @IBOutlet weak var openingCrawlTextView: UITextView!
    
    var movie: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {return}
        openingCrawlTextView.text = movie.opening_crawl

    }

}
