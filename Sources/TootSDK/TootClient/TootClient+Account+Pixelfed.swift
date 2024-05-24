//
//  TootClient+Account+Pixelfed.swift
//
//
//  Created by technicat on 12/05/24.
//

import Foundation
import MultipartKitTootSDK

extension TootClient {

    // https://github.com/pixelfed/pixelfed/issues/4250#issuecomment-1483798056
    public func updateCredentials(params: UpdateCredentialsParamsPixelfed) async throws -> Account {
        let req = try HTTPRequestBuilder {
            $0.url = getURL(["api", "v1", "accounts", "update_credentials"])
            $0.method = .post
            var parts = [MultipartPart]()
            if let name = params.displayName {
                parts.append(
                    MultipartPart(name: "display_name", body: name))
            }
            if let note = params.note {
                parts.append(
                    MultipartPart(name: "note", body: note))
            }
            if let locked = params.locked {
                parts.append(
                    MultipartPart(
                        name: "locked",
                        body: String(locked)))
            }
            parts.append(contentsOf: getSourceParts(params))
            $0.body = try .multipart(parts, boundary: UUID().uuidString)
        }
        return try await fetch(Account.self, req)
    }

    func getSourceParts(_ params: UpdateCredentialsParamsPixelfed) -> [MultipartPart] {
        var parts = [MultipartPart]()
        if let language = params.source?.language {
            parts.append(
                MultipartPart(
                    name: "source[language]",
                    body: language))
        }
        return parts
    }
}
