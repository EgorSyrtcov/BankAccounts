//
//  AccountVC.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/20/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let updateTransactionData = NSNotification.Name.init("updateTransactionData")
}

class AccountVC: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var iconTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var buttonOk: UIButton! {
        didSet {
            buttonOk.layer.borderWidth = 1
            buttonOk.layer.borderColor = UIColor.white.cgColor
            buttonOk.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var buttonCancel: UIButton! {
        didSet {
            buttonCancel.layer.borderWidth = 1
            buttonCancel.layer.borderColor = UIColor.white.cgColor
            buttonCancel.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Убираем клавиатуру
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func setupAlertController() {
        let alertController = UIAlertController(title: "Внимание, ОШИБКА!", message: "Одно из полей не заполненно!", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "ОК", style: .cancel)
        alertController.addAction(actionOk)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func okButtonAction(_ sender: UIButton) {
        
        guard let newDate = dateTextField.text,
            newDate.isEmpty == false else { setupAlertController(); return }
        let newDataInt = Int(newDate) ?? 0
        
        guard let newIcon = iconTextField.text,
            newIcon.isEmpty == false else { setupAlertController(); return }
        
        guard let newSum = sumTextField.text,
            newSum.isEmpty == false else { setupAlertController(); return }
        let newSumInt = Int(newSum) ?? 0
        
        guard let newTitle = titleTextField.text,
            newTitle.isEmpty == false else { setupAlertController(); return }
        
       Service.shared.postTransaction(date: newDataInt, icon: newIcon, sum: newSumInt, title: newTitle)
       notificationCenter.post(name: .updateTransactionData, object: nil)
        self.tabBarController?.selectedIndex = 0
    }
   
    @IBAction func cancelButtonAction(_ sender: UIButton) {
      self.tabBarController?.selectedIndex = 0
    }
    
}

