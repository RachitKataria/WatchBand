//
//  InterfaceController.swift
//  WatchBand WatchKit Extension
//
//  Created by Rachit K on 2/13/16.
//  Copyright © 2016 Rachit Kataria. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {
    
    
    var statManager = DataManager()
    var accelerationPoints: [Double] = [];
    
    func standardDeviation(arr : [Double]) -> Double
    {
        let length = Double(arr.count)
        let avg = arr.reduce(0, combine: {$0 + $1}) / length
        let sumOfSquaredAvgDiff = arr.map { pow($0 - avg, 2.0)}.reduce(0, combine: {$0 + $1})
        return sqrt(sumOfSquaredAvgDiff / length)
    }
    
    func update() {
        if let accelerationData: [String: Double] = statManager.pullData() {
            
            for (_, value) in accelerationData {
                accelerationPoints.append(value);
            }
            
            if(accelerationPoints.count == 4)
            {
                //print("Standard deviation", standardDeviation(accelerationPoints))
                
                if(standardDeviation(accelerationPoints) > 20)
                {
                    print("You're moving!");
                }
                else
                {
                    print("You stopped moving!")
                }
                
                accelerationPoints = [];
            }
            
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        print("Passed awakeWithContext");
        
        statManager.startAccelerometer();
        
        print("Started accelerometer");
        
        
        NSTimer.scheduledTimerWithTimeInterval(0.16, target: self, selector: "update", userInfo: nil, repeats: true)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
