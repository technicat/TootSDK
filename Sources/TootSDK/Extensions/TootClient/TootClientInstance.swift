extension TootClient {

    /// just a rename
    /// to do, replace the other
    public func getInstance() async throws -> Instance {
        let instance = try await getInstanceInfo()
        return instance
    }
}
