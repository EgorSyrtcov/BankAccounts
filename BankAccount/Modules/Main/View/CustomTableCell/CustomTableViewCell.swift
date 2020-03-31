//
//  CustomTableViewCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/18/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView! {
        didSet {
            self.mainImage.layer.cornerRadius = Layout.imageCornerRadiusInCustomCell
        }
    }
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var timeDayLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    func configuration(cell: Transaction, indexPath: IndexPath) {
     
        mainImage.image = UIImage(named: cell.icon ?? "basket")
        
        onlineLabel.text = cell.icon
        timeDayLabel.text = String(describing: cell.date ?? 0)
        
        let balance = Double(cell.sum ?? 0)
        let priceString = String(format: "$%.02f", balance)
        moneyLabel.text = priceString
    }
}
