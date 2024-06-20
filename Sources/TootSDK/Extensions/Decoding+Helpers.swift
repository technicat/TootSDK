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
    func decodeISOCode(forKey key: Key) throws -> ISOCode {
        do {
            return try decode(ISOCode.self, forKey: key)
        } catch {
            let string = try decode(String.self, forKey: key)
            return ISOCode(rawValue: string.lowercased()) ?? .en
            // todo - mixed case codes
        }
    }
}
