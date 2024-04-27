extension String {
    public var isBlank: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    public var notBlank: String? {
        isBlank ? nil : self
    }
}
