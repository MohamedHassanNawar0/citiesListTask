//
//  CityLocationInMap.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

protocol PresentCityLocationInMapView: class {
    func presentCityLocationInMap(latitude: String , longitude: String)
}
class CityLocationInMap{
    
    private weak var view: PresentCityLocationInMapView?
    private(set) var model: City
    
    init(view: PresentCityLocationInMapView,model: City ) {
        self.view = view
        self.model = model
    }
    // method called to show location of current city
    func viewLoadData() {
        view?.presentCityLocationInMap(latitude: model.coord?.lat ?? "", longitude: model.coord?.lon ?? "")
    }

}
