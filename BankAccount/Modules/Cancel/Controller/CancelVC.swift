//
//  CancelVC.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/20/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CancelVC: UIViewController {

    // Создаем два наблюдаемых объекта 
    @IBAction func switchAction(_ sender: UISwitch) {
        
        let nameParseOffKey = Notification.Name(rawValue: parseOffKey)
        let nameParseOnKey = Notification.Name(rawValue: parseOnKey)

       sender.isOn ? NotificationCenter.default.post(name: nameParseOnKey, object: nil) : NotificationCenter.default.post(name: nameParseOffKey, object: nil)
    }
}
