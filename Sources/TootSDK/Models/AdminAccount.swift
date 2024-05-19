//
//  AdminAccount.swift
//  
//
//  Created by Philip Chu on 5/18/24.
//

import Foundation

public struct AdminAccount: Codable, Hashable, Identifiable {
    public init(
        id: String,
        account: Account
    ) {
        self.id = id
        self.account = account
    }
    
    public var id: String
    public var account: Account
}
