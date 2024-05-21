extension String {
    public var isBlank: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    public var notBlank: String? {
        isBlank ? nil : self
    }

    public var isBlankImage: Bool {
        hasSuffix("missing.png")  // mastodon, pixelfed
            || hasSuffix("transparent.png")  // catodon
            || hasSuffix("banner.png")  // pleroma
            || hasSuffix("default_header.png")  // gotosocial
    }
}
