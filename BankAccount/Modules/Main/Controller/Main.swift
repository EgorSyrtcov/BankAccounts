//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum Layout {
    static let currentCellHeight: CGFloat = 150
    static let customCellHeight: CGFloat = 120
    static let collectionCornerRadius: CGFloat = 40
    static let imageCornerRadiusInCustomCell: CGFloat = 40
}

enum RegisterCell {
    static let customCell = "CustomTableViewCell"
    static let currentCell = "CollectionInTableViewCell"
    static let collectionViewCell = "CollectionViewCell"
}

class Main: UIViewController {
    
    var cellItems = [CellItem]()

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: RegisterCell.customCell, bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: RegisterCell.customCell)
            let currentName = UINib(nibName: RegisterCell.currentCell, bundle: nil)
            tableView.register(currentName, forCellReuseIdentifier: RegisterCell.currentCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.shared.fetchRequestCellItems { [weak self](cellItems) in
            self?.cellItems = cellItems ?? []
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellItem = cellItems[indexPath.row]
        
        switch cellItem.type {
        case "bigCell":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.currentCell) as? CollectionInTableViewCell else { return UITableViewCell.init() }
            cell.cellItems = cellItems
            return cell
        
        case "smallCell":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.customCell) as? CustomTableViewCell else { return UITableViewCell.init() }

            cell.configuration(cell: cellItem, indexPath: indexPath)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell = tableView.cellForRow(at: indexPath)
        return cell is CollectionInTableViewCell ? Layout.currentCellHeight : Layout.customCellHeight
    }
}

