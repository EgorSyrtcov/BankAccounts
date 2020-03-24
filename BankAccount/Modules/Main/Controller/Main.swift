//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

enum Layout {
    static let currentCellHeight: CGFloat = 120
    static let customCellHeight: CGFloat = 100
    static let imageCornerRadiusInCustomCell: CGFloat = 40
}

enum RegisterCell {
    static let customCell = "CustomTableViewCell"
    static let currentCell = "CurrentCell"
}

class Main: UIViewController {
    
    var cells = [CellItem]()
    private let urlString = "https://api.myjson.com/bins/uy08c"
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
        
        fetchData()
    }
    
    private func fetchData() {
        
        Alamofire.request(urlString).responseObject { (response: DataResponse<Cell>) in
            let cellsResponse = response.result.value
            self.cells = cellsResponse?.items ?? []
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellItem = cells[indexPath.row]
        
        switch cellItem.type {
        case "bigCell":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.currentCell) as? CurrentCell else { return UITableViewCell.init() }

            cell.configuration(cell: cellItem, indexPath: indexPath)
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
        return cell is CurrentCell ? Layout.currentCellHeight : Layout.customCellHeight
    }
}

