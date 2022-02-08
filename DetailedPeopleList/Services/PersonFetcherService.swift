//
//  PersonFetcherService.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 03.02.2022.
//

import Foundation

final class PersonFetcherService {
  private let networkService: NetworkService
  private let decodingService: DecodingService

  init(networkService: NetworkService = .init(), decodingService: DecodingService = .init()) {
    self.networkService = networkService
    self.decodingService = decodingService
  }

  func fetch(url: URL) async throws -> Person {
    let data = try await networkService.downloadData(with: url)
    let person = try decodingService.decode(data: data, of: Person.self)
    return person
  }
}

enum PersonFetcherServiceError: Error {
  case unknown
}

extension URL {
  fileprivate static var people: URL {
    guard let url = URL(string: "https://swapi.dev/api/people") else {
      fatalError("...")
    }
    return url
  }
}



