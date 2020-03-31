//
//  Billing.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/27/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

import ObjectMapper

struct Billing: Codable  {
    let balance: String?
    let date: Int?
    let id: Int?
    let owner: String?
    let ownerID: Int?
}

extension Billing: ImmutableMappable {
    
    init(map: Map) throws {
        balance = try map.value("balance")
        date = try map.value("date")
        id = try map.value("id")
        owner = try map.value("owner")
        ownerID = try map.value("ownerID")
    }
    
    func mapping(map: Map) {
        balance >>> map["balance"]
        date >>> map["date"]
        id >>> map["id"]
        owner >>> map["owner"]
        ownerID >>> map["ownerID"]
    }
}
