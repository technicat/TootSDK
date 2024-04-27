public protocol Emojis {

  var emojis: [Emoji] { get }

}

extension Emojis {
    
    public var hasEmoji: Bool {
        !emojis.isEmpty
    }
}
