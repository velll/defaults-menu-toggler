//
//  IconPicker.swift
//  scroller
//
//  Created by Paul on 04/10/2019.
//  Copyright © 2019 Paul. All rights reserved.
//

import Cocoa

func getIcon(mouse: Bool) -> NSImage? {
    let assetName = mouse ? "mouse-solid-32" : "trackpad-32"
    return NSImage(named:NSImage.Name(assetName))
}
