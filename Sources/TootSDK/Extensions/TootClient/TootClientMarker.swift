extension TootClient {

    public func getMarker(for timeline: Marker.Timeline) async throws -> Marker? {
        let markers = try await getMarkers(for: Set([timeline]))
        return markers[timeline]
    }
}
