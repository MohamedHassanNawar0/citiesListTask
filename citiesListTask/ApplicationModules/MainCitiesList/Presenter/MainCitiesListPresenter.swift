//
//  MainCitiesListPresenter.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

class MainCitiesListPresenter {
       //MARK: - VARIABLES AND SETUP METHODS
    private weak var view: MainCitiesListView?
    private let interactor = MainCitiesListInteractor()
    private var citiesList = [City]()
    private var searchBarText = ""
    fileprivate let googleAPiKey = "AIzaSyCkWO36j39abLGWuPY3CpYJ8325_yXLz8A"
    init(view: MainCitiesListView) {
        self.view = view
    }
    // method called to get cities
    func getCitiesList() {
        guard searchBarText == "" else {return}
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
    // method called to rearrange cities alphabetical.
    func rearrangeCitiesAlphabetical(citiesList:[City]){
        print(citiesList.count)
        self.citiesList.sort(by: self.sortCitiesListAlphabetical)
        self.view?.fetchingDataSuccess()
    }
    // method called to close keyboard after press return.
    func searchBarSearchButtonClicked(){
        self.view?.dismissKeyBoard()
    }
    // method called to detect any change happend in search bar.
    func SearchBarTextChanged(text:String) {
        searchBarText = text
        self.view?.fetchingDataSuccess()
    }
      // method called when select a city will show a map centered on the coordinates associated with the city.
    func didSelectCityRow(index: Int) {
        view?.goToShowMap(model: citiesList[index])
    }
    // method called every time reach the end of the cities table to ask for another cities if avilable.
    func didReachEndOfTableView(){
        guard interactor.didReachLastPage == false else {return}
        interactor.pageNumber += 1
        getCitiesList()
    }
    // method to return number of cities based on search bar text if text is empty it will return all else will filter cities list based on a given prefix string, over the city.
    func getCitiesListCount() -> Int {
        let count = listCitiesBasedOnSearchFilter(searchText: searchBarText, listedCities: self.citiesList).count
        return count
    }
    // method used to filter listed cities based on text writen in search bar and if search bar empty it will return all avilable cities
    func listCitiesBasedOnSearchFilter(searchText:String , listedCities:[City]) -> [City] {
        listedCities.filter({$0.name.prefix(searchText.count) == searchText.prefix(searchText.count)})
    }
    // list cities in alphabetical order (city first, country after).
       func sortCitiesListAlphabetical(this:City, that:City) -> Bool {
           if this.name == that.name {
               return this.country < that.country
           }
         return this.name < that.name
       }
   // configure city cell.
    func configureCitiesTableViewCell(cell: MainCitiesCellView, for index: Int) {
        let cities = listCitiesBasedOnSearchFilter(searchText: searchBarText, listedCities: self.citiesList)
        let latitude = cities[index].coord?.lat ?? ""
        let longitude = cities[index].coord?.lat ?? ""
        cell.displayedImage(imageUrl: getCityGoogleStaticMapImageUrl(latitude: latitude , longitude: longitude))
        let city = cities[index].name
        let country = cities[index].country
        cell.displayCity(cityName: "\(city), \(country)")
    }
    // get City Google Static Map ImageUrl from current city coordinate latitude and longitude
    func getCityGoogleStaticMapImageUrl(latitude:String , longitude:String) -> URL{
        guard let imageUrl =   URL(string:"https://maps.googleapis.com/maps/api/staticmap?markers=\(latitude),\(longitude)&zoom=10&size=600x600&key=\(googleAPiKey)") else {return URL(string: "https://www.google.com/maps")!}
        return imageUrl
    }
}
