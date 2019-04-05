//
//  FirstScreen.swift
//  weatherApp
//
//  Created by Carlos Mendieta on 4/4/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit
import CoreLocation

class FirstScreen: UIViewController, CLLocationManagerDelegate {
    private let fontSize = FontSizes()
    private let distanceContraints = DistancesConstrainst()
    
    private var cityNameLabel = UILabel()
    private var cloudinessLabel = UILabel()
    private var temperatureLabel = UILabel()
    private var windTitleLabel = UILabel()
    private var windLabel = UILabel()
    private var pressureTitleLabel = UILabel()
    private var pressureLabel = UILabel()
    private var humidityTitleLabel = UILabel()
    private var humidityLabel = UILabel()
    private var geoCoordinatesTitleLabel = UILabel()
    private var geoCoordinatesLabel = UILabel()
    private var backgroundImage = UIImageView()
    
    private let locationManager = CLLocationManager()
    private let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    private let APP_ID = "ed90b7794010d365a012488ca2857878"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        setupCityNameLabel()
        setupCloudinessLabel()
        setuptemperatureLabel()
        setupWindTitleLabel()
        setupWindLabel()
        setupPressureTitleLabel()
        setupPressureLabel()
        setupHumidityTitleLabel()
        setupHumidityLabel()
        setupGeoCoordinatesTitleLabel()
        setupGeoCoordinatesLabel()

        setConstraints()
        
        //set up the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupCityNameLabel(){
        cityNameLabel.text = "Bogotá"
        cityNameLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cityNameLabel.font = UIFont.systemFont(ofSize: fontSize.cityFontSize)
        backgroundImage.addSubview(cityNameLabel)
//        setConstraints()
    }
    
    private func setupCloudinessLabel(){
        cloudinessLabel.text = "Partly Cloudy"
        cloudinessLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cloudinessLabel.font = UIFont.systemFont(ofSize: fontSize.cloudinessFontSize)
        backgroundImage.addSubview(cloudinessLabel)
    }
    
    private func setuptemperatureLabel(){
        temperatureLabel.text = "13ºC"
        temperatureLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        temperatureLabel.font = UIFont.systemFont(ofSize: fontSize.temperatureFontSize, weight: .thin)
        backgroundImage.addSubview(temperatureLabel)
    }
    
    private func setupWindTitleLabel(){
        windTitleLabel.text = "WIND"
        windTitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        windTitleLabel.font = UIFont.systemFont(ofSize: fontSize.dataTitleFontSize)
        backgroundImage.addSubview(windTitleLabel)
    }
    
    private func setupWindLabel(){
        windLabel.text = "3 Km/h"
        windLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        windLabel.font = UIFont.systemFont(ofSize: fontSize.dataFontSize)
        backgroundImage.addSubview(windLabel)
    }
    
    private func setupPressureTitleLabel(){
        pressureTitleLabel.text = "PRESSURE"
        pressureTitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pressureTitleLabel.font = UIFont.systemFont(ofSize: fontSize.dataTitleFontSize)
        backgroundImage.addSubview(pressureTitleLabel)
    }

    private func setupPressureLabel(){
        pressureLabel.text = "1027 hPA"
        pressureLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pressureLabel.font = UIFont.systemFont(ofSize: fontSize.dataFontSize)
        backgroundImage.addSubview(pressureLabel)
    }
    
    private func setupHumidityTitleLabel(){
        humidityTitleLabel.text = "HUMIDITY"
        humidityTitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        humidityTitleLabel.font = UIFont.systemFont(ofSize: fontSize.dataTitleFontSize)
        backgroundImage.addSubview(humidityTitleLabel)
    }
    
    private func setupHumidityLabel(){
        humidityLabel.text = "66%"
        humidityLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        humidityLabel.font = UIFont.systemFont(ofSize: fontSize.dataFontSize)
        backgroundImage.addSubview(humidityLabel)
    }
    
    private func setupGeoCoordinatesTitleLabel(){
        geoCoordinatesTitleLabel.text = "GEOGRAPHICAL COORDINATES"
        geoCoordinatesTitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        geoCoordinatesTitleLabel.font = UIFont.systemFont(ofSize: fontSize.dataTitleFontSize)
        backgroundImage.addSubview(geoCoordinatesTitleLabel)
    }
    
    private func setupGeoCoordinatesLabel(){
        geoCoordinatesLabel.text = "Lat: 4.56 Long: -73.33"
        geoCoordinatesLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        geoCoordinatesLabel.font = UIFont.systemFont(ofSize: fontSize.dataFontSize)
        backgroundImage.addSubview(geoCoordinatesLabel)
    }
    
    private func setupBackgroundImage(){
        backgroundImage.image = #imageLiteral(resourceName: "night")

        view.addSubview(backgroundImage)

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false

        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    private func setConstraints(){
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudinessLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        windTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        geoCoordinatesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        geoCoordinatesLabel.translatesAutoresizingMaskIntoConstraints = false
        

        cityNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        cityNameLabel.bottomAnchor.constraint(equalTo: cloudinessLabel.topAnchor, constant: -6).isActive = true
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        cloudinessLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 6).isActive = true
        cloudinessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        temperatureLabel.topAnchor.constraint(equalTo: cloudinessLabel.bottomAnchor, constant: 6).isActive = true
        temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        temperatureLabel.bottomAnchor.constraint(lessThanOrEqualTo: windTitleLabel.topAnchor, constant: 0).isActive = true

        geoCoordinatesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        geoCoordinatesLabel.topAnchor.constraint(equalTo: geoCoordinatesTitleLabel.bottomAnchor, constant: distanceContraints.verticalDistanceCoupleData).isActive = true
        geoCoordinatesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        geoCoordinatesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true
        
        geoCoordinatesTitleLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: distanceContraints.verticalDistanceData).isActive = true
        geoCoordinatesTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        geoCoordinatesTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

        humidityLabel.topAnchor.constraint(equalTo: humidityTitleLabel.bottomAnchor, constant: distanceContraints.verticalDistanceCoupleData).isActive = true
        humidityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        humidityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

        humidityTitleLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: distanceContraints.verticalDistanceData).isActive = true
        humidityTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        humidityTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

        pressureLabel.topAnchor.constraint(equalTo: pressureTitleLabel.bottomAnchor, constant: distanceContraints.verticalDistanceCoupleData).isActive = true
        pressureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        pressureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

        pressureTitleLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: distanceContraints.verticalDistanceData).isActive = true
        pressureTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        pressureTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

        windLabel.topAnchor.constraint(equalTo: windTitleLabel.bottomAnchor, constant: distanceContraints.verticalDistanceCoupleData).isActive = true
        windLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        windLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

        windTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceContraints.leadingDistanceData).isActive = true
        windTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: distanceContraints.trailingDistanceData).isActive = true

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0{
            locationManager.stopUpdatingLocation()
            print("long: \(location.coordinate.longitude), lat: \(location.coordinate.latitude)")
            
            let longitude = location.coordinate.longitude
            let latitude = location.coordinate.latitude
            let shortLongitude = Double(round(100 * longitude)/100)
            let shortLatitude = Double(round(100 * latitude)/100)
            
            let params: [String:String] = ["lat" : String(latitude), "lon" : String(longitude), "appid" : APP_ID]
            
            geoCoordinatesLabel.text = "Lat: \(shortLatitude), Long: \(shortLongitude)"
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        //TODO: mostrar un error
    }
    
}

struct FontSizes {
    let cityFontSize = CGFloat(30)
    let cloudinessFontSize = CGFloat(13)
    let temperatureFontSize = CGFloat(80)
    let dataFontSize = CGFloat(25)
    let dataTitleFontSize = CGFloat(12)
}

struct DistancesConstrainst {
    let verticalDistanceCoupleData = CGFloat(0)
    let verticalDistanceData = CGFloat(12)
    let leadingDistanceData = CGFloat(20)
    let trailingDistanceData = CGFloat(20)
}


