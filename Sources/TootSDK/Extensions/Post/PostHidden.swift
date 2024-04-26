extension Post {

    // initially hidden
    public var isHidden: Bool {
        isSensitive || hasSpoiler
    }
}
