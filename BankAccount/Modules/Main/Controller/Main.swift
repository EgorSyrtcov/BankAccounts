//
//  Main.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/16/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum TabBarType: String {
    case time
    case message
    case account
    case close
}

enum Layout: CGFloat {
    case cornerRadiusTabBarView = 20
    case heightForRowAt = 120
    case mainViewCornerRadius = 40
}

class Main: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var currentBalanceView: UIView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarView()
    }
    
    
    private func setupTabBarView() {
        tabBarView.layer.cornerRadius = Layout.cornerRadiusTabBarView.rawValue
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // DoTo Array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell.init() }
        
            cell.moneyLabel?.text = "-$120.9\(indexPath.row)"
            cell.onlineLabel?.text = "Online"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Layout.heightForRowAt.rawValue
    }
    
    
}

