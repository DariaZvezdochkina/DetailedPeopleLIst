//
//  PlanetsViewModel.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 16.02.2022.
//

import Foundation

final class PlanetsViewModel: ObservableObject {
    @Published var planetsResult = [Planet]()
    private let fetchingService: PlanetsFetcherService
    
    init(fetcherService: PlanetsFetcherService = PlanetsFetcherService()) {
        self.fetchingService = fetcherService
    }
    
    @MainActor func fetchPlanets() async {
        do {
            let planets = try await fetchingService.fetchPlanets()
            planetsResult = planets.results
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
