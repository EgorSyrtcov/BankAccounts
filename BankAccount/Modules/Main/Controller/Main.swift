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
    private var toDoArr = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarView()
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print(TabBarType.time)
        case 1:
            print(TabBarType.message)
        case 2:
            print(TabBarType.account)
        case 3:
            print(TabBarType.close)
        default:
            return
        }
    }
    
    private func setupTabBarView() {
        tabBarView.layer.cornerRadius = Layout.cornerRadiusTabBarView.rawValue
        currentBalanceView.layer.cornerRadius = Layout.cornerRadiusTabBarView.rawValue
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let task = toDoArr[indexPath.row]
        cell.moneyLabel.text = "-$120.9\(task)"
        cell.onlineLabel.text = "Online"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Layout.heightForRowAt.rawValue
    }
    
    
}

