//
//  DetailedPlanetViewModel.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 16.02.2022.
//

import Foundation

final class DetailedPlanetViewModel: ObservableObject {
    @Published var planet: Planet?
    @Published var presentedError = false
    private let url: URL
    private let planetFetchingService: PlanetFetcherService
    
    init(planetFetchingService: PlanetFetcherService = PlanetFetcherService(), url:URL) {
        self.planetFetchingService = planetFetchingService
        self.url = url
    }
    
    func fetchPlanet() async {
        do {
            planet = try await planetFetchingService.fetchPlanet(url: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
