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
        
        let name = sender.isOn ? nameParseOnKey : nameParseOffKey
        NotificationCenter.default.post(name: name, object: nil)
    }
}
