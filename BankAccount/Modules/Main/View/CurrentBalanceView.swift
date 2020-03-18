//
//  CurrentBalanceView.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/17/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

@IBDesignable
class CurrentBalanceView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
