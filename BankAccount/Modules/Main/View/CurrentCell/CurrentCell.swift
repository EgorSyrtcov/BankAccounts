//
//  CurrentCell.swift
//  BankAccount
//
//  Created by Egor Syrtcov on 3/20/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit


class CurrentCell: UITableViewCell {
    
    var cells = [CellItem]()
    @IBOutlet weak var collectionView: UICollectionView!
}

extension CurrentCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewID")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewID", for: indexPath as IndexPath) as! CollectionViewCell
        cell.layer.cornerRadius = Layout.collectionCornerRadius
        
        let cellItem = cells[indexPath.row]
        
        cell.configuration(cell: cellItem, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 250, height: 100)
    }
}
