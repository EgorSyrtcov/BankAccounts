//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

let parseOffKey = "parseOffKey"
let parseOnKey = "parseOnKey"

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

final class Main: UIViewController {
    
    fileprivate var refreshControl = UIRefreshControl()
    fileprivate let urlDeleteTransaction = "https://bankaccounts-andersen.herokuapp.com/transaction"
    fileprivate var billingItems = [Billing]() // вверхний показатель, коллекция
    fileprivate var transactionItems = [Transaction]() // нижний показатель, таблица
    
    // количество numberOfRowsInSection
    fileprivate var countItems = 0 {
        didSet {
            countItems = billingItems.count > 0 ? (transactionItems.count + 1) : (transactionItems.count)
        }
    }
    // Отнимать единицу в ячейке CustomTableViewCell или нет
    fileprivate var transactionFirst = 0 {
        didSet {
            transactionFirst = (billingItems.count > 0) ? 1 : 0
        }
    }
    
    @IBOutlet fileprivate weak var contentView: UIView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var tableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: RegisterCell.customCell, bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: RegisterCell.customCell)
            let currentName = UINib(nibName: RegisterCell.currentCell, bundle: nil)
            tableView.register(currentName, forCellReuseIdentifier: RegisterCell.currentCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRequestAll()
        addRefreshControl()
    }
    
    private func fetchRequestAll() {
        Service.shared.fetchRequestTransactionItems { [weak self](transactionItems) in
            self?.transactionItems = transactionItems ?? []
            self?.fetchRequstBilling()
        }
    }
    
    private func fetchRequstBilling() {
        Service.shared.fetchRequestBillingItems { [weak self](billingItems) in
            self?.billingItems = billingItems ?? []
            self?.countItems = 0
            self?.transactionFirst = 0
            self?.updateData()
        }
    }
    
   private func updateData() {
        tableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    private func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.red
        refreshControl.addTarget(self, action: #selector(refreshArray), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    @objc func refreshArray() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.currentCell) as? CollectionInTableViewCell else { return UITableViewCell.init() }
            cell.billingItems = billingItems
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.customCell) as? CustomTableViewCell else { return UITableViewCell.init() }
            let transactionItem = transactionItems[indexPath.row - transactionFirst]
            cell.configuration(cell: transactionItem, indexPath: indexPath)
            return cell
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let transactionID = transactionItems[indexPath.row - transactionFirst].id else { return }
            let transactionIndex = indexPath.row - transactionFirst
            print(transactionIndex)
            Service.shared.deleteAlamofire(urlString: urlDeleteTransaction, id: transactionID)
            fetchRequestAll()
        }
    }
}
