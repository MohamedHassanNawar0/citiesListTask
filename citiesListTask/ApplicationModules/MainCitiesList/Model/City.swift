//
//  City.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

struct City: Decodable{
    var country: String?
    var name: String?
    var id: String?
    var coord: coordinateData?
}
struct coordinateData: Decodable {
    var lon: String?
    var lat: String?
}
