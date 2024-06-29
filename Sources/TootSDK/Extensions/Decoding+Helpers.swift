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
            guard let string = try decodeIfPresent(String.self, forKey: key) else {
                return nil
            }
                return string.isoCode
            }
    }
    
    func decodeISOList(forKey key: Key) throws -> [ISOCode]? {
        if let list = try decodeIfPresent([String].self, forKey: key) {
            return list.compactMap { $0.isoCode }
        } else {
            return nil
        }
    }
       
       

    func decodeUnixDate(forKey key: Key) throws -> Date {
        let weekUnixEpoc = try decodeIntFromString(forKey: key)
        return Date(timeIntervalSince1970: TimeInterval(weekUnixEpoc))
    }
}

extension String {
    
    public var isoCode: ISOCode? {
        if let code = ISOCode(rawValue: self) {
            return code
        }
            // if it failed on a hyphenated name
        // try just the first part
            let split = split(separator: "-")
            if split.count > 1 {
                let first = split[0].lowercased()
                let second = split[1].uppercased()
                return ISOCode(rawValue: "\(first)-\(second)")
            } else {
                // in case it's uppercase
                return ISOCode(rawValue: lowercased())
            }
    }
}
