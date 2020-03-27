//
//  Transaction.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/27/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//


import ObjectMapper

struct Transaction: Codable  {
    let date: Int?
    let icon: String?
    let id: Int?
    let owner: String?
    let ownerID: Int?
    let sum: Int?
    let title: String?
}

extension Transaction: ImmutableMappable {
    
    init(map: Map) throws {
        date = try map.value("date")
        icon = try map.value("icon")
        id = try map.value("id")
        owner = try map.value("owner")
        ownerID = try map.value("ownerID")
        sum = try map.value("sum")
        title = try map.value("title")
    }
    
    func mapping(map: Map) {
        date >>> map["date"]
        icon >>> map["icon"]
        id >>> map["id"]
        owner >>> map["owner"]
        ownerID >>> map["ownerID"]
        sum >>> map["sum"]
        title >>> map["title"]
    }
}


