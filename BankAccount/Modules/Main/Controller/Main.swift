//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum Layout {
    static let currentCellHeight: CGFloat = 300
    static let customCellHeight: CGFloat = 100
    static let imageCornerRadiusInCustomCell: CGFloat = 40
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
        return 5 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
          guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.currentCell) as? CurrentCell else { return UITableViewCell.init() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.customCell) as? CustomTableViewCell else { return UITableViewCell.init() }
            cell.moneyLabel.text = "-$126530.9\(indexPath.row)"
            cell.onlineLabel.text = "Online"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell = tableView.cellForRow(at: indexPath)
        return cell is CurrentCell ? Layout.currentCellHeight : Layout.customCellHeight
    }
}

