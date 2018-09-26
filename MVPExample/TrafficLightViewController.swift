//
//  TrafficLightViewController.swift
//  MVPExample
//
//  Created by Saad El Oulladi on 25/09/2018.
//  Copyright © 2018 saadeloulladi. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController, TrafficLightViewDelegate {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    @IBAction func redLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Red")
    }
    
    @IBAction func yellowLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Yellow")
    }
    
    @IBAction func greenLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Green")
    }
    
    func displayTrafficLight(description:(String)) {
        descriptionLabel.text = description
    }
}
