//
//  AlertShow.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 4/9/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class AlertShow: NSObject {//This is shared class
    static let shared = AlertShow()
    
    //Show alert
    func alert(view: UIViewController) {
        let alert = UIAlertController(title: "Внимание, ОШИБКА!", message: "Одно из полей не заполненно!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(defaultAction)
        
        view.present(alert, animated: true)
    }
    
    private override init() {
    }
}
