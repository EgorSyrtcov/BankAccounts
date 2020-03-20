//
//  CurrentCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/20/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit


class CurrentCell: UITableViewCell {

    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.cornerRadius = 20
        }
    }
}
