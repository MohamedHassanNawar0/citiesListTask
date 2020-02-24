//
//  FilterSearchTest.swift
//  citiesListTaskTests
//
//  Created by Mohamed Nawar on 2/24/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import XCTest
@testable import citiesListTask
class FilterSearchTest: XCTestCase {
    private let citiesListInteractor = MainCitiesListInteractor()
    private var citiesList = [City]()

    override func setUp() {
        getCitiesData ()
    }

    override func tearDown() {
    }
    // fetch and parse data from from CitiesJSON.txt file
    func getCitiesData () {
         let bundle = Bundle(for: type(of: self))
    guard let path = bundle.path(forResource: "CitiesJSON", ofType: "txt") else {
        XCTFail()
        return
    }
    guard let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) else {
        XCTFail()
        return
    }
    citiesListInteractor.parseJSON(data: data) { [weak self](cities, error) in
        self?.citiesList = cities ?? [City]()
        XCTAssertNotNil(cities, "should not be nil")
        XCTAssertGreaterThan(cities?.count ?? 0, 0, "should have values")
           }
     }
    // test filter search in list of cities
    func testFilterSearch() {
        let filter = Filter()
        let cities = filter.listCitiesBasedOnSearchFilter(searchText: "A", listedCities: citiesList)
        XCTAssertNotNil(cities, "should not be nil")
        XCTAssertGreaterThan(cities.count , 0, "should have values")
        print(cities.count)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
