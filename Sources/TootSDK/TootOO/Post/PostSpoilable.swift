extension Post: Spoilable {

    public var spoiler: String? {
        // maybe should check for whitespace
        guard !spoilerText.isEmpty else {
            return nil
        }
        return spoilerText
    }
}
