//
//  CurrentView.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/19/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CurrentView: UIView {
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
