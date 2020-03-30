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
    
    let group = DispatchGroup()
    
    private let urlStringBilling = "https://bankaccounts-andersen.herokuapp.com/allBilling"
    private let urlStringTransaction = "https://bankaccounts-andersen.herokuapp.com/allTransaction"
    
    
    func fetchRequestBillingItems(completion: @escaping ([Billing]?) ->()) {
        group.enter()
        Alamofire.request(urlStringBilling).responseArray { (response: DataResponse<[Billing]>) in
            var billingItems = [Billing]()
            let billingArray = response.result.value
            
            if let billingArray = billingArray {
                billingArray.forEach({billingItems.append($0)})
                 completion(billingItems)
            }
        }
        group.leave()
    }
    
    func fetchRequestTransactionItems(completion: @escaping ([Transaction]?) ->()) {
        group.enter()
        Alamofire.request(urlStringTransaction).responseArray { (response: DataResponse<[Transaction]>) in
            var transactionItems = [Transaction]()
            let transactionArray = response.result.value
            
            if let transactionArray = transactionArray {
                transactionArray.forEach({transactionItems.append($0)})
                completion(transactionItems)
            }      
        }
        group.leave()
    }
}

