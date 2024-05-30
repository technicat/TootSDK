// todo - udpate this to MastoCompatible
// when we can handle major.minor version
open class Snac: MastoAPI {
    open override var name: String { "Snac" }

    open override var supportsInstanceExtendedDescription: Bool { false }
    open override var supportsInstanceV2: Bool { false }
    open override var supportsTranslate: Bool { false }
}
