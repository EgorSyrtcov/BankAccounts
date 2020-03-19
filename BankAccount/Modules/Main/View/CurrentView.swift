//
//  CurrentView.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/19/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CurrentView: UIView {
    
    @IBOutlet var view: UIView! {
        didSet {
            self.view.layer.cornerRadius = Layout.mainViewCornerRadius.rawValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        UINib(nibName: "CurrentView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }
}
