//
//  StarWarsStruct.swift
//  Unit-Testing-Lab
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct StarWars: Codable {
    let results: [Results]
    static func getEpisodes(from data: Data) -> [Results] {
        do {
            let episodes = try JSONDecoder().decode(StarWars.self, from: data)
            return episodes.results
        } catch {
            print(error)
        }
        return [Results]()
    }
}

struct Results: Codable {
    var title: String
    var opening_crawl: String
}
