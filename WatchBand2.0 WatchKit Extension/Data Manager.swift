//
//  Data Manager.swift
//  Accelerometer Reader
//
//  Created by Rachit on 2/13/16.
//  Copyright © 2016 Rachit Kataria. All rights reserved.
//

import Foundation
import CoreMotion

class DataManager: NSObject{
    
    var manager = CMMotionManager()
    
    func startAccelerometer(){
        if manager.accelerometerAvailable {
            manager.accelerometerUpdateInterval = 0.20
            manager.startAccelerometerUpdates()
        }
    }
    
    func pullData() ->[String: Double] {
        if let myData = manager.accelerometerData {
            let data: [String: Double] = [  "y": round(100 * myData.acceleration.y)]
            return data
        }
        return [:]
    }
}