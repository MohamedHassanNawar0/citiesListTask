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
    // method called to show a progress indicator to user until finish fetching data
    func dismissKeyBoard() {
        self.searchBar.resignFirstResponder()
    }
    // method called to show a progress indicator to user until finish fetching data
    func showIndicator() {
        self.activityIndicator(isStart: true)
    }
    // method called to show a flash message to user
    func showMessage(message: String) {
        HUD.flash(.label(message), delay: 2.0)
    }
    // method called to hide progress indicator after finishing fetching data
    func hideIndicator() {
        self.activityIndicator(isStart: false)
    }
    // method called to reload cities after finishing fetching data
    func fetchingDataSuccess() {
        self.citiesTableView.reloadData()
    }
     // method called to navigate to show a map centered on the coordinates associated with the city.
    func goToShowMap(model: City) {
        let mapViewController = AppStoryboard.Map.viewController(viewControllerClass: MapViewController.self)
        let city = model.name 
        let country = model.country
        mapViewController.title = "\(city), \(country)"
        let presenter = CityLocationInMap(view: mapViewController, model: model)
        mapViewController.inject(cityLocationPresenter: presenter)
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
}
