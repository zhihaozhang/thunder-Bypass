//
//  ViewController.swift
//  thunderPassby
//
//  Created by Chih-Hao on 2018/5/29.
//  Copyright © 2018年 Chih-Hao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var thunderURLFiled: NSTextField!
    
    @IBOutlet weak var decryptedURL: NSTextField!
    
    @IBAction func decryptButtonClicked(_ sender: Any) {
        let thunderURL = thunderURLFiled.stringValue
        if thunderURL.hasPrefix("thunder://") {
            let encryptedURL = thunderURL.substring(from: thunderURL.index(thunderURL.startIndex,offsetBy :10))
            print(encryptedURL)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

