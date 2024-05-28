extension UserTimelineQuery {

    public init(
        for account: Account, onlyMedia: Bool? = nil, onlyPins pinned: Bool? = nil,
        onlyTagged tag: Tag? = nil
    ) {
        self.init(userId: account.id, onlyMedia: onlyMedia, pinned: pinned, tagged: tag?.name)
    }

}
