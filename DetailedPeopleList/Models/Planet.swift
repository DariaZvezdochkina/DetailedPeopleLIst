//
//  Planet.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 15.02.2022.
//

import Foundation

struct Planet: Codable, Equatable, Identifiable {
    let name: String
    let rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents: [Int]
    let films: [String]
    let created, edited: String
    let url: String
    var id: String { url }
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

