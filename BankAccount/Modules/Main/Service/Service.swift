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
    case transaction = "transaction"
    case newBilling = "newBilling"
    case newTransaction = "newTransaction"
}

enum KeyUrl: String {
    case adressParse = "adressParse"
}

class Service {
    
    static var shared = Service()
    private var urlString = ""
    
    init() {
        urlString = getStringUrl(forKey: KeyUrl.adressParse.rawValue)
    }
    
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
    
    func getStringUrl(forKey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else { fatalError("Could not find value for key \(key) in Info.plist") }
        return value
    }
    
    func deleteAlamofire(path: AdressBankAccount, id: Int) {
        let parameters: Parameters = ["id" : id]
        guard let url = URL(string: urlString + "\(path.rawValue)") else { return }
        Alamofire.request(url, method: .delete, parameters: parameters)
        
    }
    
    func postBilling(date: Int, balance: Int) {
        let params: [String: Any] = ["date": date, "balance": balance, "ownerID": 1]
        guard let url = URL(string:"\(urlString)\(AdressBankAccount.newBilling)") else { return }
        Alamofire.request(url, method: .post, parameters: params)
    }

    func postTransaction(transaction: Transaction) {
        let params: [String: Any] = ["date": transaction.date ?? "", "icon": transaction.icon ?? "", "sum": transaction.sum ?? "", "title" : transaction.title ?? "", "ownerID": 1]
        guard let url = URL(string:"\(urlString)\(AdressBankAccount.newTransaction)") else { return }
        Alamofire.request(url, method: .post, parameters: params)
    }
}

