//
//  MainCitiesListPresenter.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

class MainCitiesListPresenter {
    
    private weak var view: MainCitiesListView?
    private let interactor = MainCitiesListInteractor()
    private var citiesList = [City]()
    init(view: MainCitiesListView) {
        self.view = view
    }
    // method called to request forecast weather for selected city
    func getCitiesList() {
        view?.showIndicator()
        interactor.getCitiesList() { [weak self] (cities, error) in
                        guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showMessage(message: error)
            } else {
                guard let citiesListData = cities else { return }
                self.citiesList += citiesListData
                self.rearrangeCitiesAlphabetical(citiesList: self.citiesList)

            }
        }
    }
    func rearrangeCitiesAlphabetical(citiesList:[City]){
        print(citiesList.count)
        self.citiesList.sort(by: self.sortCitiesListAlphabetical)
        self.view?.fetchingDataSuccess()
    }
    func searchBarSearchButtonClicked(){
        self.view?.dismissKeyBoard()
    }
    func SearchBarTextChanged(text:String) {
        
    }
    func didSelectCityRow(index: Int) {
        view?.goToShowMap(model: citiesList[index])
    }
    func didReachEndOfTableView(){
        interactor.pageNumber += 1
        getCitiesList()
    }
    //method to return number of forecast weather for selected city
    func getCitiesListCount() -> Int {
        print(citiesList.count )
        return citiesList.count
    }
    //list cities in alphabetical order (city first, country after)
       func sortCitiesListAlphabetical(this:City, that:City) -> Bool {
           if this.name == that.name {
               return this.country < that.country
           }
         return this.name < that.name
       }
   //configure Forecast Weather Cell
    func configureCitiesTableViewCell(cell: MainCitiesCellView, for index: Int) {
        cell.displayedImage(latitude:citiesList[index].coord?.lat ?? "" , longitude: citiesList[index].coord?.lat ?? "")
        let city = citiesList[index].name 
        let country = citiesList[index].country 
        cell.displayCity(cityName: "\(city), \(country)")
    }
}
