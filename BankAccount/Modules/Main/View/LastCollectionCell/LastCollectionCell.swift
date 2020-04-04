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
        
        let addTransaction = AddTransaction.initFromStoryboard()
        
        parentViewController?.present(addTransaction, animated: true, completion: nil)
    }
}
