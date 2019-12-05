struct Config {
    static let domain = ".GlobalPreferences"
    static let key = "com.apple.swipescrolldirection"
    
    static let options = [
        true: ["str": "1",  "icon": "trackpad-32"],     // 'natural' — good for trackpad
        false: ["str": "0", "icon": "mouse-solid-32"]   // 'not natural' — pretty natural for wheeled mice
    ]
}

