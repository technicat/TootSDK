extension Announcement: HTMLable {
    public var html: String? {
        content.notBlank
    }
}
