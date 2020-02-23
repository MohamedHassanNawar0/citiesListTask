//
//  MainCitiesListVC+Presenter.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//
//
import PKHUD
import UIKit
extension MainCitiesListVC: MainCitiesListView {
    func dismissKeyBoard() {
        self.searchBar.resignFirstResponder()
    }
    
    func showfilteredCities(cityName: String) {
        print(cityName)
    }
    
    func showIndicator() {
        self.activityIndicator(isStart: true)
    }
    
    func showMessage(message: String) {
        HUD.flash(.label(message), delay: 2.0)
    }
    
    func hideIndicator() {
        self.activityIndicator(isStart: false)
    }
    
    func fetchingDataSuccess() {
        self.citiesTableView.reloadData()
    }
    
     // navigate to show  city location in map
    func goToShowMap(model: City) {
        let storybord = UIStoryboard(name: "Map", bundle: nil)
        let mapViewController = storybord.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let city = model.name 
        let country = model.country
        mapViewController.title = "\(city), \(country)"
        let presenter = CityLocationInMap(view: mapViewController, model: model)
        mapViewController.inject(cityLocationPresenter: presenter)
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
}
