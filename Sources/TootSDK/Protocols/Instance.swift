/// common properties between InstanceV1 and InstanceV2
public protocol Instance {

    var description: String? { get }
    var title: String? { get }
    var version: String { get }
    var rules: [InstanceRule]? { get }
    var configuration: Configuration? { get }
    //  var contactAccount: Account? { get }
}

extension Instance {

    public var hasDescription: Bool {
        guard let description else {
            return false
        }
        return !description.isBlank
    }
}
