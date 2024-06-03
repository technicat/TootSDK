open class Iceshrimp: Firefish {

    open override var name: String { "Iceshrimp" }

    open override var supportsFilter: Bool { false }
    open override var supportsInstanceExtendedDescription: Bool { false }
    open override var supportsInstanceV2: Bool { false }
    open override var supportsIsBoosted: Bool { true }
    open override var supportsPostDeleteAndEdit: Bool { true }
    open override var supportsReportRules: Bool { false }
}
