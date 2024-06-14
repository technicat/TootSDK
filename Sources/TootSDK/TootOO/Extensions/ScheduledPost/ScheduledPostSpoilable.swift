extension ScheduledPost: Spoilable {

    public var spoiler: String? {
        guard let text = params.spoilerText else {
            return nil
        }
        return text.notBlank
    }
}
