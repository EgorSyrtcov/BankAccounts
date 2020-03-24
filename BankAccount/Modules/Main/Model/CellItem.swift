//
//  CellItem.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/23/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import ObjectMapper

struct CellItem: Codable  {
    let type: String?
    let balance: Int?
    let date: Int?
    let icon: String?
    let sum: Int?
    let title: String?
}

extension CellItem: ImmutableMappable {
    
    init(map: Map) throws {
        type = try map.value("type")
        balance = try map.value("balance")
        date = try map.value("date")
        icon = try map.value("icon")
        sum = try map.value("sum")
        title = try map.value("title")
    }
    
    func mapping(map: Map) {
        type >>> map["type"]
        balance >>> map["balance"]
        date >>> map["date"]
        icon >>> map["icon"]
        sum >>> map["sum"]
        title >>> map["title"]
    }
}

