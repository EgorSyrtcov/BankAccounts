//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum Layout {
    static let currentRadiusCell: CGFloat = 120
    static let customRadiusCell: CGFloat = 100
    static let mainViewCornerRadius: CGFloat = 40
}

enum RegisterCell {
    static let customCell = "CustomTableViewCell"
    static let currentCell = "CurrentCell"
}

class Main: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: RegisterCell.customCell, bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: RegisterCell.customCell)
            let currentName = UINib(nibName: RegisterCell.currentCell, bundle: nil)
            tableView.register(currentName, forCellReuseIdentifier: RegisterCell.currentCell)
        }
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // DoTo Array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = Bundle.main.loadNibNamed(RegisterCell.currentCell, owner: self, options: nil)?.first as! CurrentCell
            return cell
        default:
             let cell = Bundle.main.loadNibNamed(RegisterCell.customCell, owner: self, options: nil)?.first as! CustomTableViewCell
            cell.moneyLabel.text = "-$126530.9\(indexPath.row)"
            cell.onlineLabel.text = "Online"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case 0:
            return Layout.currentRadiusCell
        default:
            return Layout.customRadiusCell
        }
    }
}

