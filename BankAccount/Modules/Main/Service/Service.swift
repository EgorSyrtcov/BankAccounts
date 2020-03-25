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
    
    func fetchData(completion: @escaping ([CellItem]?) ->()) {
        
        Alamofire.request(urlString).responseObject { (response: DataResponse<Cell>) in
            let cellsResponse = response.result.value
            completion(cellsResponse?.items)
        }
    }
}
import Foundation
