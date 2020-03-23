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
    
    var users = [User?]()
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
        
        let URL = "https://api.myjson.com/bins/uy08c"
        Alamofire.request(URL).responseObject { (response: DataResponse<User>) in
            let courses = response.result.value
            self.users.append(courses)
            
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
        return users.count // DoTo Array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.currentCell) as? CurrentCell else { return UITableViewCell.init() }
            
            let user = users[indexPath.row]
            cell.configuration(user: (user ?? nil)!, indexPath: indexPath)
            
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

