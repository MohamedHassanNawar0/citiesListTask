//
//  MainlListPresenterProtocols.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import Foundation

protocol MainCitiesListView: class {
    func showIndicator()
    func showMessage(message:String)
    func hideIndicator()
    func fetchingDataSuccess()
    func goToShowMap(model: City)
    func dismissKeyBoard()
    func showfilteredCities(cityName: String)
}

protocol MainCitiesCellView {
    func displayCity(cityName: String)
    func displayedImage(latitude:String , longitude: String)
}

