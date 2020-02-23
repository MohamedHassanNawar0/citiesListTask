//
//  MainCitiesListVC+SearchBar.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

extension MainCitiesListVC: UISearchBarDelegate {
    // search bar design
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.clear
        searchBar.searchTextField.textColor = .white
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
