//
//  DecodingServiceFunctionalTests.swift
//  DetailedPeopleList
//
//  Created by Daria Zvezdochkina on 11.02.2022.
//

@testable import DetailedPeopleList
import XCTest
import SwiftUI

class DecodingServiceFunctionalTests: XCTestCase {
    
    private var jsonData: Data!
    private var decodingService: DecodingService!
    
    override func setUpWithError() throws {
        decodingService = DecodingService()
        jsonData = .jsonData
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        decodingService = nil
        jsonData = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPeopleJSONShouldBeParsedToPeopleObject() {
        let receivedData = try? decodingService.decode(data: jsonData, of: People.self)
        XCTAssertNoThrow(try decodingService.decode(data: jsonData, of: People.self), "Should throw an error while retrieving non-existing value")
    }
    
    func testRandomJSONShouldNotBeParsedToPeopleObject() {
        //
    }
    
}

extension Data {
    static var jsonData: Data {
        
        let jsonData = """
            {
                "name": "Luke Skywalker",
                "height": "172",
                "mass": "77",
                "hair_color": "blond",
                "skin_color": "fair",
                "eye_color": "blue",
                "birth_year": "19BBY",
                "gender": "male",
                "homeworld": "https://swapi.dev/api/planets/1/",
                "films": [
                    "https://swapi.dev/api/films/1/",
                    "https://swapi.dev/api/films/2/",
                    "https://swapi.dev/api/films/3/",
                    "https://swapi.dev/api/films/6/"
                ],
                "species": [],
                "vehicles": [
                    "https://swapi.dev/api/vehicles/14/",
                    "https://swapi.dev/api/vehicles/30/"
                ],
                "starships": [
                    "https://swapi.dev/api/starships/12/",
                    "https://swapi.dev/api/starships/22/"
                ],
                "created": "2014-12-09T13:50:51.644000Z",
                "edited": "2014-12-20T21:17:56.891000Z",
                "url": "https://swapi.dev/api/people/1/"
            }
        """
        let data = jsonData.data(using: .utf8)!
        return data
    }
}
