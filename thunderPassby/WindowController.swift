//
//  WindowController.swift
//  thunderPassby
//
//  Created by Chih-Hao on 2018/5/29.
//  Copyright © 2018年 Chih-Hao. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        let customToolbar = NSToolbar()
        customToolbar.showsBaselineSeparator = false
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.backgroundColor = .gray
        window?.toolbar = customToolbar
        
        
        
    }

}
