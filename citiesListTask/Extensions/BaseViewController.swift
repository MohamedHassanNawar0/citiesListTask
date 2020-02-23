//
//  BaseViewController.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
//MARK: - Base view controller to my view controller
class BaseViewController: UIViewController {
    
       override func viewDidAppear(_ animated: Bool) {
          self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
          self.navigationController?.navigationBar.shadowImage = UIImage()
          self.navigationController?.navigationBar.barTintColor = .clear
          self.navigationController?.navigationBar.backgroundColor = .clear
          self.navigationController?.navigationBar.barTintColor = .black
          self.navigationController?.navigationBar.tintColor = .black
          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]

      }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .darkContent
    }
}
