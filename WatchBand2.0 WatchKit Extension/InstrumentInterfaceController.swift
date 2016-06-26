//
//  InstrumentInterfaceController.swift
//  WatchBand2.0
//
//  Created by Rachit K on 2/13/16.
//  Copyright © 2016 Rachit Kataria. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InstrumentInterfaceController: WKInterfaceController, WCSessionDelegate {
   
    @IBOutlet var guitarButton: WKInterfaceButton!
    
    @IBOutlet var bassButton: WKInterfaceButton!
    
    @IBOutlet var drumsButton: WKInterfaceButton!
    
    @IBAction func didPressGuitar()
    {
        //setGuitarText()
    }
    @IBAction func didPressBass()
    {
        //setBassText()
    }
    
    @IBAction func didPressDrums()
    {
        //setDrumsText()
    }
    
    @IBAction func setGuitarText() {
        let text = "guitar";
        
        let guitarText = ["text" : text]
        
        session.sendMessage(guitarText, replyHandler: { (result) -> Void in
                // TODO: Handle your data from the iPhone
            
            }, errorHandler: { (error) -> Void in
                // TODO: Handle error - iPhone many not be reachable
                print(error)
        })
    }
    
    
    @IBAction func setBassText() {
        let text = "bass";
        
        let bassText = ["text" : text]
        
        session.sendMessage(bassText, replyHandler: { (result) -> Void in
            // TODO: Handle your data from the iPhone
            
            }, errorHandler: { (error) -> Void in
                // TODO: Handle error - iPhone many not be reachable
                print(error)
        })

    }
    
    @IBAction func setDrumsText()
    {
        let text = "drums";
        
        let drumsText = ["text" : text]
        
        session.sendMessage(drumsText, replyHandler: { (result) -> Void in
            // TODO: Handle your data from the iPhone
            
            }, errorHandler: { (error) -> Void in
                // TODO: Handle error - iPhone many not be reachable
                print(error)
        })
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    var session : WCSession!
    
    override func willActivate() {
        super.willActivate()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
