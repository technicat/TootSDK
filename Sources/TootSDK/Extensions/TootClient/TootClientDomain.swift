extension TootClient {

    public var domain: String {
        instanceURL.host ?? instanceURL.absoluteString
    }
}
