//
//  Decoding+Helpers.swift
//  Created by Łukasz Rutkowski on 18/03/2023.
//

import Foundation

extension KeyedDecodingContainerProtocol {
    func decodeIntFromString(forKey key: Key) throws -> Int {
        do {
            return try decode(Int.self, forKey: key)
        } catch {
            let string = try decode(String.self, forKey: key)
            if let int = Int(string) {
                return int
            }
            throw error
        }
    }
    
    func decodeStringFromInt(forKey key: Key) throws -> String {
        do {
            return try decode(String.self, forKey: key)
        } catch {
            let int = try decode(Int.self, forKey: key)
            return String(int) 
        }
    }

    func decodeOptionalIntFromString(forKey key: Key) throws -> Int? {
        do {
            return try decodeIfPresent(Int.self, forKey: key)
        } catch {  // type mismatch
            if let string = try decodeIfPresent(String.self, forKey: key) {
                return Int(string)
            }
        }
        return nil
    }

    func decodeBoolFromString(forKey key: Key) throws -> Bool {
        do {
            return try decode(Bool.self, forKey: key)
        } catch {
            let string = try decode(String.self, forKey: key)
            if let bool = Bool(string) {
                return bool
            }
            throw error
        }
    }

    // make this optional?
    func decodeISOCode(forKey key: Key) throws -> ISOCode? {
        do {
            return try decodeIfPresent(ISOCode.self, forKey: key)
        } catch {
            // workaround two problems
            // (both evident in Akkoma translations):
            // uppercase codes
            // unsupported hyphenated codes
            let string = try decode(String.self, forKey: key)
            let split = string.split(separator: "-")
            if split.count > 1 {
                return ISOCode(rawValue: split[0].lowercased()) ?? .en
            } else {
                return ISOCode(rawValue: string.lowercased()) ?? .en
            }
        }
    }
}
