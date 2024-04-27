extension Announcement: HTML {
    public var html: String? {
        content.notBlank
    }
}
