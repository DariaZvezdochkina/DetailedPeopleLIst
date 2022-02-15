//
//  Planets.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 15.02.2022.
//

import Foundation

struct Planets: Decodable, Equatable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Planet]
}
