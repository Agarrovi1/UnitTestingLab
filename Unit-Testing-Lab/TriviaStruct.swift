//
//  TriviaStruct.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
enum JSONError: Error {
    case decodingError(Error)
}

protocol AnsInfo {
    var correctAns: String {get}
    var incorrectAns: [String] {get}
    func makeArrOfAns() -> [String]
}

struct Trivia: Codable {
    let results: [TriviaInfo]
    static func getTrivias(from data: Data) throws -> [TriviaInfo] {
        do {
            let results = try JSONDecoder().decode(Trivia.self, from: data)
            return results.results
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct TriviaInfo: Codable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    func takePercentFromQuestion() -> String {
        if let question = question.removingPercentEncoding {
            return question
        }
        return question
    }
    func takePercentFromCorrectAnswer() -> String {
        if let answer = correct_answer.removingPercentEncoding {
            return answer
        }
        return correct_answer
    }
    func takePercentFromIncorrectAnswers() -> [String] {
        var newArr = [String]()
        for a in incorrect_answers {
            if let incorrect = a.removingPercentEncoding {
                newArr.append(incorrect)
            }
        }
        return newArr
    }
}
