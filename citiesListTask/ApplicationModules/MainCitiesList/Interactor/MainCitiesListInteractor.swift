//
//  MainCitiesListInteractor.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

protocol APIServiceGetCitiesListProtocol {
    func getCitiesList(completionHundler: @escaping ([City]?,String?) -> Void)
}

class MainCitiesListInteractor: APIServiceGetCitiesListProtocol {

    fileprivate let citiesListEndpoint = "http://assignment.pharos-solutions.de/cities.json?page="
    var pageNumber = 1
    fileprivate var citiesList = [City]()
    var didReachLastPage = false
    
    // Simulate a long waiting for fetching Suggested Cities based on writing in search bar
    func getCitiesList(completionHundler: @escaping ([City]?, String?) -> Void) {
        guard  didReachLastPage == false else { return }
        print("\(citiesListEndpoint)\(pageNumber)")
      NetworkRequest().Request(url: "\(citiesListEndpoint)\(pageNumber)", method: .get, parameters: nil, headers: nil){
            response , error in
            if response == nil && error == nil{
                completionHundler(nil,nil)
            }else{
                if error == nil{
                  self.parseJSON(data: response?.data ?? Data(), completionHundler: {
                        (suggestedCities , error) in
                    if error == nil{
                        completionHundler(suggestedCities, nil)
                    }else{
                        completionHundler(nil, error)
                    }
                    })
                }else{
                    completionHundler(nil, error?.message)
                }
            }
        }
    }
    //method used to parse respone
    func parseJSON(data : Data , completionHundler: @escaping ([City]?, String?) -> Void) {
           do {
            self.citiesList = try  JSONDecoder().decode([City].self,from:(data))
            if self.citiesList.count == 0 {
                       self.didReachLastPage = true
                   }
            completionHundler(citiesList, nil)
            }catch{
                print(error.localizedDescription)
                completionHundler(nil, error.localizedDescription)
        }
    }
}
