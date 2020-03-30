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


enum AdressBankAccount: String {
    case allBilling = "allBilling"
    case allTransaction = "allTransaction"
}

class Service {

    static var shared = Service()
    
    private let urlString = AdressParse.getStringUrl(forKey: "adressParse")

    func fetchRequestBillingItems(completion: @escaping ([Billing]?) ->()) {

        Alamofire.request("\(urlString)\(AdressBankAccount.allBilling)").responseArray { (response: DataResponse<[Billing]>) in
            var billingItems = [Billing]()
            let billingArray = response.result.value
            
            if let billingArray = billingArray {
                billingArray.forEach({billingItems.append($0)})
                 completion(billingItems)
            }
        }
    }
    
    func fetchRequestTransactionItems(completion: @escaping ([Transaction]?) ->()) {
        Alamofire.request("\(urlString)\(AdressBankAccount.allTransaction)").responseArray { (response: DataResponse<[Transaction]>) in
            var transactionItems = [Transaction]()
            let transactionArray = response.result.value
            
            if let transactionArray = transactionArray {
                transactionArray.forEach({transactionItems.append($0)})
                completion(transactionItems)
            }      
        }
    }
}

