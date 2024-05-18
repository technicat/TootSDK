//
//  PixelfedReportParams.swift
//
//
//  Created by Łukasz Rutkowski on 31/10/2023.
//

import Foundation

public struct PixelfedReportParams: Codable {
    var objectType: ObjectType
    var objectId: String
    var type: Report.Category
    var msg: String?

    enum ObjectType: String, Codable {
        case post
        case user
    }

    private enum CodingKeys: String, CodingKey {
        case objectType = "object_type"
        case objectId = "object_id"
        case type = "report_type"
        case msg = "msg"
    }
}
