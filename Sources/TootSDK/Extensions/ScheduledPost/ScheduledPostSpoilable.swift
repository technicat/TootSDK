extension ScheduledPost: Spoilable {

    public var spoiler: String? {
        // maybe should check for whitespace
        guard let text = params.spoilerText else {
            return nil
        }
        guard !text.isEmpty else {
            return nil
        }
        return params.spoilerText
    }
}
