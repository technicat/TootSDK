// Created by konstantin on 10/02/2023.
// Copyright (c) 2023. All rights reserved.

import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

extension TootClient {
    /// Obtain general information about the server
    public func getInstance() async throws -> InstanceV1 {
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
    
    public func getInstancePeers() async throws -> [String] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "peers"])
            $0.method = .get
        }
        return try await fetch([String].self, req)
    }

    public func getInstanceRules() async throws -> [InstanceRule] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "rules"])
            $0.method = .get
        }
        return try await fetch([InstanceRule].self, req)
    }

    /// Obtain an extended description of this server
    public func getExtendedDescription() async throws -> ExtendedDescription {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "extended_description"])
            $0.method = .get
        }
        return try await fetch(ExtendedDescription.self, req)
    }

    /// Translation language pairs supported by the translation engine used by the server.
    public func getTranslationLanguages() async throws -> [String: [String]] {
        let req = HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "instance", "translation_languages"])
            $0.method = .get
        }
        return try await fetch([String: [String]].self, req)
    }
}
