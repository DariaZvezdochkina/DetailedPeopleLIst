//
//  PlanetsFetcherService.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 15.02.2022.
//

import Foundation
import UIKit

final class PlanetsFetcherService {
    
    private let networkingService: NetworkService
    private let decodingService: DecodingService
    private let url: URL
    
    init(networkingService: NetworkService = .init(), decodingService: DecodingService = .init(), url: URL = .planets) {
        self.networkingService = networkingService
        self.decodingService = decodingService
        self.url = url
    }
    
    func fetchPlanets() async throws -> Planets {
        let data = try await networkingService.downloadData(with: url)
        let decodedPlanets = try decodingService.decode(data: data, of: Planets.self)
        return decodedPlanets
    }
}

extension URL {
    static var planets: URL {
        guard let url = URL(string: "https://swapi.dev/api/planets/") else {
            fatalError("")
        }
        return url
    }
}
