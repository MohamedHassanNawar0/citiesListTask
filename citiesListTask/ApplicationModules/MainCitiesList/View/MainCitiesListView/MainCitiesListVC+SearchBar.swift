//
//  MainCitiesListVC+SearchBar.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

extension MainCitiesListVC: UISearchBarDelegate {
    // search bar design setup
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.clear
        searchBar.searchTextField.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    // click to search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.searchBarSearchButtonClicked()
    }
    // get new data while changing data
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.SearchBarTextChanged(text: searchBar.text!)
    }
}
