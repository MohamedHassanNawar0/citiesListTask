//
//  CitiesTableViewCell.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher

class CitiesTableViewCell:UITableViewCell {
   //MARK: - OUTLETS
   @IBOutlet weak var cityNameLbl : UILabel!
   @IBOutlet weak var cityStaticImageView : UIImageView!
}
//MARK: - Configure cell data
extension CitiesTableViewCell: MainCitiesCellView {
    func displayedImage(imageUrl:URL) {
        print(imageUrl)
        cityStaticImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "54361720_1923844597725646_599066900349059072_n"))
       cityStaticImageView.kf.setImage(with: imageUrl, placeholder: nil)
    }
    func displayCity(cityName: String) {
        cityNameLbl.text = cityName
    }
}
