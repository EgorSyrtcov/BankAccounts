//
//  TableViewCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/17/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView! {
        didSet {
            self.mainImage.layer.cornerRadius = Layout.mainViewCornerRadius.rawValue
        }
    }
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var timeDayLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
}
