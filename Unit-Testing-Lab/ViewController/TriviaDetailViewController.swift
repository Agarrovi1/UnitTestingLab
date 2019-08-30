//
//  TriviaDetailViewController.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class TriviaDetailViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var triviaQuestion: TriviaInfo?
    
    @IBAction func answerChosen(_ sender: UIButton) {
        guard let chosenAns = sender.titleLabel?.text else {return}
        switch chosenAns {
        case correctAns:
            self.view.backgroundColor = .green
            disableAllButtons()
        default:
            self.view.backgroundColor = .red
            disableAllButtons()
        }
    }
    private func disableAllButtons() {
        buttonOne.isEnabled = false
        buttonTwo.isEnabled = false
        buttonThree.isEnabled = false
        buttonFour.isEnabled = false
    }
    
    private func setButtonsTitles() {
        var arrOfAns = makeArrOfAns()
        switch arrOfAns.count {
        case 2:
            buttonThree.isHidden = true
            buttonFour.isHidden = true
            buttonOne.setTitle(arrOfAns[0], for: .normal)
            buttonTwo.setTitle(arrOfAns[1], for: .normal)
        case 4:
            buttonThree.isHidden = false
            buttonFour.isHidden = false
            buttonOne.setTitle(arrOfAns[0], for: .normal)
            buttonTwo.setTitle(arrOfAns[1], for: .normal)
            buttonThree.setTitle(arrOfAns[2], for: .normal)
            buttonFour.setTitle(arrOfAns[3], for: .normal)
        default:
            buttonThree.isHidden = false
            buttonFour.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let trivia = triviaQuestion else {return}
        questionLabel.text = trivia.takePercentFromQuestion()
        setButtonsTitles()
        
    }

}
extension TriviaDetailViewController: AnsInfo {
    var correctAns: String {
        guard let ans = triviaQuestion else {return triviaQuestion?.correct_answer ?? ""}
        return ans.takePercentFromCorrectAnswer()
    }
    
    var incorrectAns: [String] {
        guard let ans = triviaQuestion else {return triviaQuestion?.incorrect_answers ?? []}
        return ans.takePercentFromIncorrectAnswers()
    }
    
    func makeArrOfAns() -> [String] {
        var arr = incorrectAns
        arr.append(correctAns)
        arr.shuffle()
        return arr
    }
    
    
}
