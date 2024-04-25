public protocol Accted {
    
    var acct: String { get }
}

extension Accted {
    
    public var atName: String {
        acct.atName
    }
}
