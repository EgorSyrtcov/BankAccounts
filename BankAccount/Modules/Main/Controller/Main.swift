//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

//let parseOffKey = "parseOffKey"
//let parseOnKey = "parseOnKey"

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
    
    var billingItems = [Billing]()
    var transactionItems = [Transaction]()
    
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
        
        Service.shared.fetchRequestTransactionItems { [weak self](transactionItems) in
            self?.transactionItems = transactionItems ?? []
        }
        
        Service.shared.fetchRequestBillingItems { [weak self](billingItems) in
            self?.billingItems = billingItems ?? []
            self?.updateData()
        }
    }
    
    func updateData() {
        tableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.currentCell) as? CollectionInTableViewCell else { return UITableViewCell.init() }
            cell.billingItems = billingItems
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.customCell) as? CustomTableViewCell else { return UITableViewCell.init() }
            let transactionItem = transactionItems[indexPath.row]
            
            cell.configuration(cell: transactionItem, indexPath: indexPath)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return Layout.currentCellHeight
        default:
            return Layout.customCellHeight
        }
    }
}

