//
//  People.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 01.02.2022.
//

import Foundation

struct People: Decodable, Equatable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Person]
}
