//
//  Filter.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/24/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
@testable import citiesListTask
class Filter {
    
     func listCitiesBasedOnSearchFilter(searchText:String , listedCities:[City]) -> [City] {
           listedCities.filter({$0.name.prefix(searchText.count) == searchText.prefix(searchText.count)})
       }
}
