//
//  PeopleFetcherService.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 01.02.2022.
//

import Foundation

final class PeopleFetcherService {
  private let url: URL
  private let networkService: NetworkService
  private let decodingService: DecodingService
  
  init(url: URL = .people, networkService: NetworkService = .init(), decodingService: DecodingService = .init()) {
    self.url = url
    self.networkService = networkService
    self.decodingService = decodingService
  }
  
  func fetch() async throws -> People {
    let data = try await networkService.downloadData(with: url)
    let people = try decodingService.decode(data: data, of: People.self)
    return people
  }
}

enum PeopleFetcherServiceError: Error {
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
