import Cocoa

class IconPicker {
    var icons: [Bool:String];
    
    init(iconDict: [Bool:String]) {
        icons = iconDict
    }

    func getIcon(key: Bool) -> NSImage? {
        let assetName = icons[key]!

        return NSImage(named:NSImage.Name(assetName))
    }
}
