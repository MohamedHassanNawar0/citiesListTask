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
   
   @IBOutlet weak var cityNameLbl : UILabel!
   @IBOutlet weak var cityStaticImageView : UIImageView!
}
extension CitiesTableViewCell: MainCitiesCellView {
    func displayedImage(latitude:String , longitude: String) {
        let imageUrl = URL(string: "https://maps.googleapis.com/maps/api/staticmap?markers=\(latitude),\(longitude)&zoom=14&size=600x600&key=AIzaSyCkWO36j39abLGWuPY3CpYJ8325_yXLz8A")
        cityStaticImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "54361720_1923844597725646_599066900349059072_n"))

       cityStaticImageView.kf.setImage(with: imageUrl, placeholder: nil)
    }
    func displayCity(cityName: String) {
        cityNameLbl.text = cityName
    }
}
