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
    
    func deletePost(id: Int, completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "https://bankaccounts-andersen.herokuapp.com/transaction\(id)") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            if let err = err {
                completion(err)
                return
            }
            completion(nil)
        }.resume()
    }
    
    func deleteAlamofire(id: Int) {
        let paramentes: Parameters = ["id" : [id]]
        
         guard let url = URL(string: "https://bankaccounts-andersen.herokuapp.com/transaction") else { return }
        
        Alamofire.request(url, method: .delete, parameters: paramentes)
    }
}

