//
//  MapViewController.swift
//  citiesListTask
//
//  Created by Mohamed Nawar on 2/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: BaseViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var mapView : UIView!
    private(set) var cityLocationPresenter: CityLocationInMap!

    //MARK: - Screen LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLocationPresenter.viewLoadData()
    }
    
    //MARK: - helper methods
    func inject(cityLocationPresenter: CityLocationInMap) {
        self.cityLocationPresenter = cityLocationPresenter
    }
}
extension MapViewController: PresentCityLocationInMapView {
    func presentCityLocationInMap(latitude: String, longitude: String) {
        guard latitude != "" && longitude != "" else {return}
        let cityLatitude = Double(latitude) ?? Double()
        let cityLongitude = Double(longitude) ?? Double()
        print(cityLatitude)
        print(cityLongitude)
                let camera = GMSCameraPosition.camera(withLatitude: cityLatitude, longitude: cityLongitude, zoom: 15.0)
                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                self.view = mapView
                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: cityLatitude, longitude: cityLongitude)
                marker.map = mapView

    }
    
    
}
