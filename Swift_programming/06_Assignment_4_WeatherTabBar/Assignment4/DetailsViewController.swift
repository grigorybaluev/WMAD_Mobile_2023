//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by MacBook on 25.04.2023.
//  Copyright © 2023 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
  var city: City?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    if let city = city {
      let vertView = UIStackView(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 200, width: 300, height: 300))
      vertView.axis = .vertical
      vertView.distribution = .fillEqually
      
      
      let countryLabel = UILabel()
      let country = city.country
      countryLabel.text = "COUNTRY: \(country)"
      countryLabel.textAlignment = .center
      countryLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let cityLabel = UILabel()
      let cityName = city.name
      cityLabel.text = "CITY: \(cityName)"
      cityLabel.textAlignment = .center
      cityLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let tempLabel = UILabel()
      let temp = city.temp
      tempLabel.text = "TEMPERATURE: \(temp)"
      tempLabel.textAlignment = .center
      tempLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let precLabel = UILabel()
      let prec = city.precipitation
      precLabel.text = "PRECIPITATION: \(prec)"
      precLabel.textAlignment = .center
      precLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let sumLabel = UILabel()
      let sum = city.summary
      sumLabel.text = "SUMMARY: \(sum)"
      sumLabel.textAlignment = .center
      sumLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      vertView.addArrangedSubview(countryLabel)
      vertView.addArrangedSubview(cityLabel)
      vertView.addArrangedSubview(tempLabel)
      vertView.addArrangedSubview(precLabel)
      vertView.addArrangedSubview(sumLabel)
      view.addSubview(vertView)
    }
  }
}
