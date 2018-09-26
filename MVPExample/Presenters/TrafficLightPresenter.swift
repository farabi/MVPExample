//
//  TrafficLightPresenter.swift
//  MVPExample
//
//  Created by Saad El Oulladi on 20/09/2018.
//  Copyright © 2018 saadeloulladi. All rights reserved.
//

import Foundation

protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description:(String))
}

class TrafficLightPresenter {
    private let trafficLightService:TrafficLightService
    weak private var trafficLightViewDelegate : TrafficLightViewDelegate?
    
    init(trafficLightService:TrafficLightService){
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate:TrafficLightViewDelegate?){
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName:(String)){

        trafficLightService.getTrafficLight(colorName: colorName) { [weak self] traficLight in

            if let traficLight = traficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: traficLight.description)
            }
        }
    }
}
