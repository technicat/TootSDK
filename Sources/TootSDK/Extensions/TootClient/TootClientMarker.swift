extension TootClient {

    public func getMarker(for timeline: MarkerTimeline) async throws -> Marker? {
        let markers = try await getMarkers(for: Set([timeline]))
        return markers[timeline]
    }
}
