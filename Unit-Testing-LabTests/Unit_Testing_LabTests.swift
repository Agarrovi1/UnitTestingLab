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

}
