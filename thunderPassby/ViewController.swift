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
            
            let decryptedURL1 = Base64FS.decodeString(str: encryptedURL).substring(from: thunderURL.index(thunderURL.startIndex,offsetBy :2))
            
            let decryptedURL2 = decryptedURL1.substring(to: decryptedURL1.index(decryptedURL1.endIndex,offsetBy :-2))
            
            decryptedURL.stringValue = decryptedURL2
            
        } else{
            
            let alert = NSAlert()
            alert.addButton(withTitle: "OK")
            
            alert.messageText = "Alert"
            
            alert.informativeText = "please input correct thunder download url which hasPrefix thunder://"
            
            alert.alertStyle = .informational
        
            
            alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
            
            
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

