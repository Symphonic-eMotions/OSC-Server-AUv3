//
//  ViewController.swift
//  OSC-Server-AUv3
//
//  Created by Frans-Jan Wind on 12/05/2021.
//

import UIKit
import SwiftOSC

var serverOSC = OSCServer(address: "", port: 3545)



class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serverOSC.start()
        
        class OSCHandler: OSCServerDelegate {
            
            func didReceive(_ message: OSCMessage){
                if let integer = message.arguments[0] as? Int {
                    print("Received int \(integer)")
                } else {
                    print(message)
                }
            }
        }
        serverOSC.delegate =  OSCHandler()
    
    }
}

