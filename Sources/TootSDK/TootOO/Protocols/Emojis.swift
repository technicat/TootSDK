public protocol Emojis {

    var emojiList: [Emoji] { get }

}

extension Emojis {

    public var hasEmoji: Bool {
        return !emojiList.isEmpty
    }
}
