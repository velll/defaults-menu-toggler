import Cocoa

class Toggler {
    static let app = Toggler() // yep, singleton
    
    var icons: IconPicker
    var button: NSStatusBarButton?
    var value: DefaultValueAdapter
    
    private init() {
        value = DefaultValueAdapter(domain: Config.domain,
                                    key: Config.key,
                                    options: Config.options.mapValues { el in el["str"]! })
        
        icons = IconPicker(iconDict: Config.options.mapValues{ el in el["icon"]! })
    }
   
    func registerButton(btn: NSStatusBarButton) {
        button = btn
    }
    
    func getImage() -> NSImage? {
        return icons.getIcon(key: value.getBoolean())
    }
    
    func flipState() {
        value.toggle()

        button!.image = icons.getIcon(key: value.getBoolean())
    }
}

