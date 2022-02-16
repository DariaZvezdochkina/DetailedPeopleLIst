//
//  FetcherServiceFunctionalPlanetsTests.swift
//  DetailedPeopleListTests
//
//  Created by Daria Zvezdochkina on 15.02.2022.
//

import XCTest
@testable import DetailedPeopleList

class FetcherServiceFunctionalPlanetsTests: XCTestCase {
    
    private var examplePlanets: Planets!
    
    override func setUpWithError() throws {
        examplePlanets = try! JSONDecoder().decode(Planets.self, from: .planetsJSON)
    }
    
    override func tearDownWithError() throws {
        examplePlanets = nil
    }
    
    func testCorrectURLShouldReturnTypePlanets() async {
        let fetchingService = PlanetsFetcherService()
        
        do {
            let planets = try await fetchingService.fetchPlanets()
            XCTAssertEqual(planets, examplePlanets)
        } catch {
            XCTFail("Planets expected to be fetched with correct url, but failed \(error).")
        }
        XCTAssertNotNil(planets, "")
        XCTAssertEqual(planets, examplePlanets, "")
    }
    
    func testIncorrectURLShouldNotReturnTypePlanets() {
        
    }
    
}

extension Data {
    static var planetsJSON: Data {
        let examplePlanets = """
{
    "name": "Hoth",
    "rotation_period": "23",
    "orbital_period": "549",
    "diameter": "7200",
    "climate": "frozen",
    "gravity": "1.1 standard",
    "terrain": "tundra, ice caves, mountain ranges",
    "surface_water": "100",
    "population": "unknown",
    "residents": [],
    "films": [
        "https://swapi.dev/api/films/2/"
    ],
    "created": "2014-12-10T11:39:13.934000Z",
    "edited": "2014-12-20T20:58:18.423000Z",
    "url": "https://swapi.dev/api/planets/4/"
}
"""
        let data = examplePlanets.data(using: .utf8)!
        return data
    }
}
