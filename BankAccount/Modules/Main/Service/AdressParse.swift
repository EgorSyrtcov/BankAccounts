//
//  AdressParse.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/30/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

struct AdressParse {
    static func getStringUrl(forKey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else { fatalError("Could not find value for key \(key) in Info.plist") }
        return value
    }
}
