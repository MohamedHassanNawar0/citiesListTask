//
//  ViewController.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

import UIKit
class MainCitiesListVC: BaseViewController {
    
    //MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var citiesTableView : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    private(set) var presenter: MainCitiesListPresenter!
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    //MARK: - Screen Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView(tableView: citiesTableView)
        setupTableViewCell()
        setupSearchBar()
        setupActivityIndicator()
        self.title = "Cities"
        presenter = MainCitiesListPresenter(view: self)
        presenter.getCitiesList()
        
    }
    //MARK: - Helper methods
    
    func setupTableViewCell() {
        citiesTableView?.register(CitiesTableViewCell.self)
    }
    //MARK: - setup Activity Indicator
    func setupActivityIndicator() {
        activityIndicator.center = view.center
    }
    func activityIndicator (isStart : Bool){
        if isStart{
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }else{
            activityIndicator.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
    }

}

