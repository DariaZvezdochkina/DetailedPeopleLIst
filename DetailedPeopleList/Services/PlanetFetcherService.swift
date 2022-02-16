//
//  PlanetFetcherService.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 15.02.2022.
//

import Foundation

final class PlanetFetcherService {
    private let networkingService: NetworkService
    private let decodingService: DecodingService
    
    init(networkingService: NetworkService = .init(), decodingService: DecodingService = .init()) {
        self.networkingService = networkingService
        self.decodingService = decodingService
    }
    
    func fetchPlanet(url: URL) async throws -> Planet {
        let data = try await networkingService.downloadData(with: url)
        let decodedPlanet = try decodingService.decode(data: data, of: Planet.self)
        return decodedPlanet
    }
}

extension URL {
    static var planet: URL {
        guard let url = URL(string: "https://swapi.dev/api/planets/") else {
            fatalError("")
        }
        return url
    }
}
