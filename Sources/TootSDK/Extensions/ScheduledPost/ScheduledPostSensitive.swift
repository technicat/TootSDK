extension ScheduledPost: Sensible {

    public var isSensitive: Bool {
        params.sensitive ?? false
    }
}
