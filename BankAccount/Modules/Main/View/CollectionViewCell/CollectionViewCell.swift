//
//  CollectionViewCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/24/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
   
    func configuration(cell: CellItem, indexPath: IndexPath) {
    
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
    
        let priceString = currencyFormatter.string(from: cell.balance as NSNumber? ?? 0)!
    
        currentLabel.text = "Current Balance \(String(describing: cell.date ?? 0))"
        moneyLabel.text = priceString
    }
}
