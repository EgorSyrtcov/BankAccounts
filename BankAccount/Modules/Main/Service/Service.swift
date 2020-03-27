//
//  Service.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/25/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Service {
    
    static var shared = Service()
    private let urlString = "https://api.myjson.com/bins/uy08c"
    
    func fetchRequestCellItems(completion: @escaping ([CellItem]?) ->()) {
        
        Alamofire.request(urlString).responseObject { (response: DataResponse<Cell>) in
            let cellsResponse = response.result.value
            completion(cellsResponse?.items)
        }
    }
    
    func fetchMockRequest() -> [CellItem] {
        return [CellItem(type: "bigCell", balance: 10000, date: 1584709316, icon: nil, sum: nil, title: nil), CellItem(type: "smallCell", balance: 184, date: 1584709316, icon: "shop", sum: 180, title: "Market"), CellItem(type: "smallCell", balance: 130, date: 1584509316, icon: "shop", sum: 160, title: "Backstar"), CellItem(type: "smallCell", balance: 120, date: 2584709316, icon: "shop", sum: 230, title: "AppStore")]
    }
}

