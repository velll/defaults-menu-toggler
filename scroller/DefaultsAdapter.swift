//
//  defaultsAdapter.swift
//  scroller
//
//  Created by Paul on 04/10/2019.
//  Copyright © 2019 Paul. All rights reserved.
//

import Foundation

let defaults = "/usr/bin/defaults";
let domain = ".GlobalPreferences"
let key = "com.apple.swipescrolldirection"

func getDefaultValue() -> String {
    let out = Pipe()
    let task = Process()
    
    task.launchPath = defaults
    task.arguments = ["read", domain, key]
    task.standardOutput = out
    task.launch()

    let result = String(data: out.fileHandleForReading.availableData, encoding: String.Encoding.utf8) ?? "nothing"
    
    return result.trimmingCharacters(in: .whitespacesAndNewlines)
}

func setDefaultValue(val: String) {
    let task = Process()
    task.launchPath = defaults
    task.arguments = ["write", domain, key, val]
    task.launch()
}
