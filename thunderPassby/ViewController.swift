//
//  ViewController.swift
//  thunderPassby
//
//  Created by Chih-Hao on 2018/5/29.
//  Copyright © 2018年 Chih-Hao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSUserNotificationCenterDelegate {

    @IBOutlet weak var thunderURLFiled: NSTextField!
    
    @IBOutlet weak var decryptedURL: NSTextField!
    
    @IBAction func decryptButtonClicked(_ sender: Any) {
        let thunderURL = thunderURLFiled.stringValue
        if thunderURL.hasPrefix("thunder://") {
            let encryptedURL = thunderURL.substring(from: thunderURL.index(thunderURL.startIndex,offsetBy :10))
            
            
            let decryptedURL0 = Base64FS.decodeString(str: encryptedURL)
            
            if decryptedURL0.count > 0{
                
                let decryptedURL1 = decryptedURL0.substring(from: thunderURL.index(thunderURL.startIndex,offsetBy :2))
            
                let decryptedURL2 = decryptedURL1.substring(to: decryptedURL1.index(decryptedURL1.endIndex,offsetBy :-2))
                
                decryptedURL.stringValue = decryptedURL2
                
                // copy decrypted URL automaticly for users
                let pasteboard = NSPasteboard.general
                pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
                pasteboard.setString(decryptedURL2, forType: NSPasteboard.PasteboardType.string)
                
                let userNotification = NSUserNotification()
                userNotification.title = "Message"
                userNotification.subtitle = "恭喜成功破解迅雷下载地址"
                userNotification.informativeText = "提示:地址已帮您复制到剪切板"
                // 使用NSUserNotificationCenter发送NSUserNotification
                let userNotificationCenter = NSUserNotificationCenter.default
               
               
                userNotificationCenter.delegate = self
                
                userNotificationCenter.scheduleNotification(userNotification)
            }else{
                let userNotification = NSUserNotification()
                userNotification.title = "Message"
                userNotification.subtitle = "解码失败"
                userNotification.informativeText = "请输入正确的迅雷下载地址"
                // 使用NSUserNotificationCenter发送NSUserNotification
                let userNotificationCenter = NSUserNotificationCenter.default
                
                
                userNotificationCenter.delegate = self
                
                userNotificationCenter.scheduleNotification(userNotification)
                
                thunderURLFiled.stringValue = ""
            }
            
        } else{
            
            let alert = NSAlert()
            alert.addButton(withTitle: "OK")
            
            alert.messageText = "Alert"
            
            alert.informativeText = "please input correct thunder download url which hasPrefix thunder://"
            
            alert.alertStyle = .informational
        
            alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
            
            thunderURLFiled.stringValue = ""
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
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }


}

