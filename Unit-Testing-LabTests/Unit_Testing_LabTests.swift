//
//  Unit_Testing_LabTests.swift
//  Unit-Testing-LabTests
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import XCTest
@testable import Unit_Testing_Lab

class Unit_Testing_LabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: -- Joke Model Tests
    func testJokesExists() {
        let data = getDataFromJokeJSON()
        let jokes = Jokes.getJokes(from: data)
        XCTAssertTrue(jokes.count > 0, "array from Jokes.getJokes() does not exist")
    }
    func testJokesHasCountTen() {
        let data = getDataFromJokeJSON()
        let jokes = Jokes.getJokes(from: data)
        XCTAssertTrue(jokes.count == 10, "there are \(jokes.count) in jokes.count")
    }
    
    private func getDataFromJokeJSON() -> Data {
        guard let pathToJokes = Bundle.main.path(forResource: "jokes", ofType: "json") else {return Data()}
        let url = URL(fileURLWithPath: pathToJokes)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }
    
    //MARK: -- Star Wars Tests
    func testStarWarsResultsExists() {
        
        let data = getDataFromStarWarsJSON()
        let episodes = StarWars.getEpisodes(from: data)
        XCTAssertTrue(episodes != nil, "There is nothing in .results of StarWars")
    }
    func testStarWarsResultIsSevenCount() {
        let data = getDataFromStarWarsJSON()
        let episodes = StarWars.getEpisodes(from: data)
        XCTAssertTrue(episodes.count == 7, "There is nothing in .results of StarWars")
    }
    func testOpeningCrawlExists() {
        let data = getDataFromStarWarsJSON()
        let episodes = StarWars.getEpisodes(from: data)
        for a in episodes {
            if a.opening_crawl == "" {
                XCTAssertTrue(false, "there was nothing in opening crawl")
            }
        }
        XCTAssertTrue(true, "there are opening crawls")
    }
    private func getDataFromStarWarsJSON() -> Data {
        guard let pathToStarWars = Bundle.main.path(forResource: "starWars", ofType: "json") else {return Data()}
        let url = URL(fileURLWithPath: pathToStarWars)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }
    
    //MARK: -- Trivia Tests
    func testGetTriviaIsNotEmpty() {
        
        let data = getDataFromTriviaJSON()
        do {
        let trivias = try Trivia.getTrivias(from: data)
              XCTAssertTrue(trivias.count == 10, "trivias is empty, \(trivias.count)")
        } catch {
           print(error)
        }
      
    
    }
    
    func getDataFromTriviaJSON() -> Data {
        
        guard let pathToTrivia = Bundle.main.path(forResource: "trivia", ofType: "json") else {return Data()}
        let url = URL(fileURLWithPath: pathToTrivia)
        do {
            let data = try Data(contentsOf: url)
            print("we got data")
            return data
        } catch let jsonError {
            fatalError("error: \(jsonError)")
        }
    }
    
    
    func testIfQuestionHasPercentSymbol() {
        let data = getDataFromTriviaJSON()
        do {
        let trivias = try Trivia.getTrivias(from: data)
        for a in trivias {
            if a.takePercentFromQuestion().contains("%") {
                XCTAssertTrue(false, "expected no % but, \(a.takePercentFromQuestion())")
            }
        }
        XCTAssertTrue(true, "no % in question")
        } catch {
            print(error)
        }
    }
    func testIfCorrectHasPercentSymbol() {
        let data = getDataFromTriviaJSON()
        do {
            let trivias = try Trivia.getTrivias(from: data)
            for a in trivias {
                if a.takePercentFromCorrectAnswer().contains("%") {
                    XCTAssertTrue(false, "expected no % but, \(a.takePercentFromCorrectAnswer())")
                }
            }
            XCTAssertTrue(true, "no % in question")
        } catch {
            print(error)
        }
    }

}
