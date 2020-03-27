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
   
    func configuration(cell: Billing, indexPath: IndexPath) {
    
        let priceString = "\(cell.balance ?? "Нет денег")"
    
        currentLabel.text = "Current Balance \(String(describing: cell.date ?? 0))"
        moneyLabel.text = priceString
    }
}
