//
//  AddTransaction.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 04/04/2020.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class AddTransaction: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var balanceTextField: UITextField!

    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        print("OK")
    }
    
}
