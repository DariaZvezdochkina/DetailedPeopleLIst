//
//  DetailedDataViewModel.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 03.02.2022.
//

import Foundation

import Combine

final class DetailedDataViewModel: ObservableObject {
    @Published var person: Person?
    @Published var shouldPresentError = false
    private let url: URL
    private let personFetcherService: PersonFetcherService
    
    init(personFetcherService: PersonFetcherService = PersonFetcherService(), url: URL) {
        self.personFetcherService = personFetcherService
        self.url = url
    }
    
    
    func fetchPerson() async {
        do {
            person = try await personFetcherService.fetch(url: url)
        } catch {
            shouldPresentError = true
        }
    }
    
}
