//
//  ViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private func getDataFromTriviaJSON() -> Data {
        
        guard let pathToJokes = Bundle.main.path(forResource: "trivia", ofType: "json") else {return Data()}
        let url = URL(fileURLWithPath: pathToJokes)
        do {
            let data = try Data(contentsOf: url)
            print("we got data")
            return data
        } catch let jsonError {
            fatalError("error: \(jsonError)")
        }
        
    }
//     let data = getDataFromTriviaJSON()
   // var trivia = Trivia.getTrivias(from: getDataFromTriviaJSON(self))
    override func viewDidLoad() {
        super.viewDidLoad()
       getDataFromTriviaJSON()

        // Do any additional setup after loading the view.
    }


}

