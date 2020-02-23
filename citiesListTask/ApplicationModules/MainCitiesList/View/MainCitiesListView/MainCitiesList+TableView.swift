//
//  MainCitiesList+TableView.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

extension MainCitiesListVC: UITableViewDataSource, UITableViewDelegate {
    //MARK: - setup tableViewDataSource and tableViewDelegate
    func setupTableView(tableView:UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCitiesListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let CityCell = tableView.dequeueReusableCell(CitiesTableViewCell.self, for: indexPath)
            presenter.configureCitiesTableViewCell(cell: CityCell, for: indexPath.row)
            return CityCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            presenter.didSelectCityRow(index: indexPath.row)
    }
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == (presenter.getCitiesListCount()) - 1  {
                presenter.didReachEndOfTableView()
            }
        }
    }

