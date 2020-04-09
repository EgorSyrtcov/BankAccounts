//
//  AddTransaction.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 04/04/2020.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let updateBillingData = NSNotification.Name.init("updateBillingData")
}

class AddTransaction: UIViewController {
 
    let notificationCenter = NotificationCenter.default
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var balanceTextField: UITextField!
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        
        guard let newDate = dateTextField.text,
            newDate.isEmpty == false else { setupAlertController(); return }
        let newDataInt = Int(newDate) ?? 0
        
        guard let newBalance = balanceTextField.text,
            newBalance.isEmpty == false else { setupAlertController(); return }
        let newBalanceInt = Int(newBalance) ?? 0
        
        Service.shared.postBilling(date: newDataInt, balance: newBalanceInt)
        notificationCenter.post(name: .updateBillingData, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupAlertController() {
        let alertController = UIAlertController(title: "Внимание, ОШИБКА!", message: "Одно из полей не заполненно!", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "ОК", style: .cancel)
        alertController.addAction(actionOk)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
