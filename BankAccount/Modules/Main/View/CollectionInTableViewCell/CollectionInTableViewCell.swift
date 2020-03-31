//
//  CollectionInTableViewCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/20/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum SizeForItemCell {
    static let width = 250
    static let height = 100
}

class CollectionInTableViewCell: UITableViewCell {
    
    var billingItems = [Billing]()
    @IBOutlet weak var collectionView: UICollectionView!
}

extension CollectionInTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: RegisterCell.collectionViewCell, bundle: nil), forCellWithReuseIdentifier: RegisterCell.collectionViewCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return billingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegisterCell.collectionViewCell, for: indexPath as IndexPath) as? CollectionViewCell else { return CollectionViewCell() }
        cell.layer.cornerRadius = Layout.collectionCornerRadius
        
        let billingItem = billingItems[indexPath.row]
        
        cell.configuration(cell: billingItem, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: SizeForItemCell.width, height: SizeForItemCell.height)
    }
}
