//
//  ViewController.swift
//  OSC-Server-AUv3
//
//  Created by Frans-Jan Wind on 12/05/2021.
//

import UIKit
import SwiftOSC

var serverOSC = OSCServer(address: "", port: 3545)

class ViewController: UIViewController, OSCServerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serverOSC.delegate = self
    }
    
    func didReceive(_ message: OSCMessage){
        
        print(message)
        
//            if let integer = message.arguments[0] as? Int {
//                print("Received int \(integer)")
//            } else {
//                print(message)
//            }
    }
    
    @IBAction func startStop(_ sender: UIButton) {
        
        if( sender.isSelected ){
            sender.isSelected = false
            sender.setTitle("Start", for: .normal)
            serverOSC.stop()
        }
        else{
            sender.isSelected = true
            sender.setTitle("Stop", for: .normal)
            serverOSC.start()
        }

    }
    
}

