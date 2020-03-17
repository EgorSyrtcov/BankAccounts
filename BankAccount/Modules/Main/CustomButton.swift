//
//  CustomButton.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/17/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        
    }
}

