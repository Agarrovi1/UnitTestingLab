//
//  JokeStruct.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Jokes: Codable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
    
    static func getJokes(from data: Data) -> [Jokes] {
        do {
        let jokes = try JSONDecoder().decode([Jokes].self, from: data)
            return jokes
        } catch {
            print(error)
        }
        return [Jokes]()
    }
}
