//
//  City.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
//MARK: - SETUP CITY MODEl
struct City: Decodable{
    var country : String
    var name : String
    var id : String?
    var coord : coordinateData?
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case name = "name"
        case id = "id"
        case coord = "coord"
    }
}
struct coordinateData: Decodable {
    var lon: String?
    var lat: String?
}
