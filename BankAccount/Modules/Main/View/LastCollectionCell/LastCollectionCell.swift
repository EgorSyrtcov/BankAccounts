//
//  LastCollectionCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 4/3/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class LastCollectionCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        layer.cornerRadius = Layout.collectionCornerRadius
    }
    
    @IBAction func addTransactionButton(_ sender: UIButton) {
        
        let vc = parentViewController
        
        let storyBoard = UIStoryboard(name: "AddTransaction", bundle: nil)
        let addTransaction = storyBoard.instantiateViewController(withIdentifier: "AddTransaction") as! AddTransaction
        
        vc?.present(addTransaction, animated: true, completion: nil)
    }
}
