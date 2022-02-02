//
//  ContentViewModel.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 01.02.2022.
//

import Foundation

import Combine

final class ContentViewModel: ObservableObject {
    @Published var results = [Person]()
    private let fetcherService: PeopleFetcherService
    
    init(fetcherService: PeopleFetcherService = PeopleFetcherService()) {
        self.fetcherService = fetcherService
    }
    
    @MainActor func fetchData() async {
        do {
            let people = try await fetcherService.fetch()
            results = people.results
        } catch {
            print(error.localizedDescription)
            // TODO: - handle error
        }
    }
    
}
