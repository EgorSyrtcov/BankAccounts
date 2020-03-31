//
//  LoaderView.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/31/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    fileprivate func setup() {
        layer.cornerRadius = 50
        backgroundColor = .red
    }
    
}
