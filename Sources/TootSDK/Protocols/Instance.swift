/// common properties between InstanceV1 and InstanceV2
public protocol Instance {
    
    var description: String? { get }
}

extension Instance {
    
    public var hasDescription: Bool {
        guard let description else {
            return false
        }
        return !description.isBlank
    }
}
