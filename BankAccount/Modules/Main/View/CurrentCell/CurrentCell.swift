//
//  CurrentCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/20/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit


class CurrentCell: UITableViewCell {
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.cornerRadius = 20
        }
    }
    
    func configuration(user: User, indexPath: IndexPath) {
        
        guard let user = user.cells?[indexPath.row] else { return }
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        let priceString = currencyFormatter.string(from: user.balance as NSNumber? ?? 0)!
        
        currentLabel.text = "Current Balance \(String(describing: user.date ?? 0))"
        moneyLabel.text = priceString
    }
}
