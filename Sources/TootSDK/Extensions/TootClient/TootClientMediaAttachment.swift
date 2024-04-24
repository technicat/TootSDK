import TootSDK

extension TootClient {
    public func getMedia(from media: UploadedMediaAttachment) async throws -> MediaAttachment? {
        try await getMedia(id: media.id)
    }

    public func refresh(_ media: MediaAttachment) async throws -> MediaAttachment? {
        try await getMedia(id: media.id)
    }

}
