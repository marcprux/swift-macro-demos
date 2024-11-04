import MacroDemo

public func demoStringify() -> String {
    let result = #stringify(1 + 2)
    return result.1
}

