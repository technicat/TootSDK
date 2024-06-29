/// common properties between InstanceV1 and InstanceV2
public protocol Instance: Headable {

    var domain: String { get }
    var description: String? { get }
    var title: String? { get }
    var version: String { get }
    var rules: [InstanceRule]? { get }
    var languages: [ISOCode]? { get }
    var configuration: Configuration? { get }
    var streaming: String? { get }
    var registrationEnabled: Bool? { get }
    var registrationApprovalRequired: Bool? { get }
    var contactEmail: String? { get }
    var contactAccount: Account? { get }
    var pleroma: PleromaInstance? { get }
    var backgroundImage: String? { get }
}

extension Instance {

    public var profileFieldsLimit: Int? {
        pleroma?.metadata.fieldsLimits.maxFields
    }
}
