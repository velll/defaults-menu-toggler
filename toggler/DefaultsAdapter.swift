import Foundation

class DefaultValueAdapter {
    let defaults = "/usr/bin/defaults"

    var domain: String
    var key: String
    var options: [Bool:String]
    
    init(domain: String, key: String, options: [Bool:String]) {
        self.domain = domain
        self.key = key
        self.options = options
    }
    
    private func get() -> String {
        let out = Pipe()
        let task = Process()
        
        task.launchPath = defaults
        task.arguments = ["read", domain, key]
        task.standardOutput = out
        task.launch()
        task.waitUntilExit()

        let result = String(data: out.fileHandleForReading.availableData, encoding: String.Encoding.utf8) ?? "nothing"
        
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func set(str: String) {
        let task = Process()
        task.launchPath = defaults
        task.arguments = ["write", domain, key, str]
        task.launch()
    }

    func getBoolean() -> Bool {
        return get() == options[true]
    }
    
    func setBoolean(val: Bool) {
        set(str: val ? options[true]! : options[false]!)
    }
    
    func toggle() {
        setBoolean(val: !getBoolean())
    }
}
