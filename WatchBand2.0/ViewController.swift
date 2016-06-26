//
//  ViewController.swift
//  WatchBand2.0
//
//  Created by Rachit K on 2/13/16.
//  Copyright © 2016 Rachit Kataria. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    @IBOutlet internal weak var guitarLabel: UILabel!
    
    @IBOutlet weak var drumsLabel: UILabel!
    
    @IBOutlet weak var bassLabel: UILabel!
    
    var session: WCSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        let whichButton = message["text"] as? String
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        dispatch_async(dispatch_get_main_queue()) {
            if(whichButton == "bass")
            {
                print(whichButton)
                self.bassLabel.text = whichButton
            }
            else if(whichButton == "guitar")
            {
                print(whichButton)
                self.guitarLabel.text = whichButton
            }
            else if(whichButton == "drums")
            {
                print(whichButton)
                self.drumsLabel.text = whichButton
            }
        }
    }
    
    
}

