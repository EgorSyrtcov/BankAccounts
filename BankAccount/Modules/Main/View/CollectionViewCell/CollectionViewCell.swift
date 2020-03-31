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
        let myData = cell.date ?? 0
        let timeInterval = NSDate(timeIntervalSinceNow: TimeInterval(myData))
        currentLabel.text = "Data \(timeInterval)"
        
        let balance = Double(cell.balance ?? "")
        let priceString = String(format: "$%.02f", balance ?? 0)
        moneyLabel.text = priceString
    }
}
