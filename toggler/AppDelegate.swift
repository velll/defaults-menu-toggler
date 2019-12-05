//
//  AppDelegate.swift
//  scroller
//
//  Created by Paul on 04/10/2019.
//  Copyright © 2019 Paul. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let toggler = Toggler.app
        
        if let button = statusItem.button {
            button.image = toggler.getImage()
            button.action = #selector(click(_:))
            toggler.registerButton(btn: button)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func click(_ sender: Any?) {
        Toggler.app.flipState()
    }
}

