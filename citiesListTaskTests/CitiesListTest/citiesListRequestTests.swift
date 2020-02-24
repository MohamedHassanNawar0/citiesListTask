//
//  citiesListRequestTests.swift
//  citiesListRequestTests
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import XCTest
@testable import citiesListTask

class citiesListRequestTests: XCTestCase {

   private let citiesListInteractor = MainCitiesListInteractor()

       override func setUp() {
             continueAfterFailure = false
         }

    override func tearDown() {
        
    }
    // testing fetching data from the server
     func testFetchDataRequest() {
          let exp = expectation(description: "server fetch")
        citiesListInteractor.getCitiesList(completionHundler: { (cities, error) in
            guard error == nil else {
                XCTFail()
                return
            }
                XCTAssertNotNil(cities, "should not be nil")
                XCTAssertGreaterThan(cities?.count ?? 0, 0, "should have values")
                exp.fulfill()
        })
          waitForExpectations(timeout: 5) { (error) in
              print (error?.localizedDescription ?? "")
                 }
      }

    // testing parsing data from from CitiesJSON.txt file
    func testParseCitiesListJSON() {
             let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "CitiesJSON", ofType: "txt") else {
            XCTFail()
            return
        }
        guard let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) else {
            XCTFail()
            return
        }
        citiesListInteractor.parseJSON(data: data) { (cities, error) in
            XCTAssertNotNil(cities, "should not be nil")
            XCTAssertGreaterThan(cities?.count ?? 0, 0, "should have values")
               }
         }
   // testing fetching data from the server performance
    func testPerformanceFetchingCities() {
        measure {
        let exp = expectation(description: "server fetch")
            citiesListInteractor.getCitiesList(completionHundler: { (cities, error) in
                exp.fulfill()
            })
            waitForExpectations(timeout: 10.0, handler: { (error) in
                print (error?.localizedDescription ?? "")
            })
        }
    }
    // testing parsing data from CitiesJSON.txt file
    func testPerformanceforParsingData() {
        let bundle = Bundle(for: type(of: self))
          guard let path = bundle.path(forResource: "CitiesJSON", ofType: "txt") else {
              XCTFail()
              return
          }
          guard let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) else {
              XCTFail()
              return
          }
           measure {
           let exp = expectation(description: "server fetch")
            citiesListInteractor.parseJSON(data: data, completionHundler: { (cities, error) in
                   exp.fulfill()
               })
               waitForExpectations(timeout: 10.0, handler: { (error) in
                   print (error?.localizedDescription ?? "")
               })
           }
       }

}
