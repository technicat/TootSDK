// Created by konstantin on 10/02/2023.
// Copyright (c) 2023. All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

extension TootClient {
    /// Obtain general information about the server
    public func getInstanceV1() async throws -> InstanceV1 {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance"])
            $0.method = .get
        }
        return try await fetch(InstanceV1.self, req)
    }

    /// Obtain general information about the server
    public func getInstanceV2() async throws -> InstanceV2 {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v2", "instance"])
            $0.method = .get
        }
        return try await fetch(InstanceV2.self, req)
    }

    /// https://docs.joinmastodon.org/methods/instance/#activity
    public func getInstanceActivity() async throws -> [Activity] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "activity"])
            $0.method = .get
        }
        return try await fetch([Activity].self, req)
    }

    /// Obtain an extended description of this server
    /// https://docs.joinmastodon.org/methods/instance/#extended_description
    public func getExtendedDescription() async throws -> ExtendedDescription {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "extended_description"])
            $0.method = .get
        }
        return try await fetch(ExtendedDescription.self, req)
    }

    /// https://docs.joinmastodon.org/methods/instance/#peers
    public func getInstancePeers() async throws -> [String] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "peers"])
            $0.method = .get
        }
        return try await fetch([String].self, req)
    }

    /// https://docs.joinmastodon.org/methods/instance/#rules
    public func getInstanceRules() async throws -> [InstanceRule] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "rules"])
            $0.method = .get
        }
        return try await fetch([InstanceRule].self, req)
    }

    /// Translation language pairs supported by the translation engine used by the server.
    /// https://docs.joinmastodon.org/methods/instance/#translation_languages
    public func getTranslationLanguages() async throws -> [String: [String]] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "translation_languages"])
            $0.method = .get
        }
        return try await fetch([String: [String]].self, req)
    }
}
