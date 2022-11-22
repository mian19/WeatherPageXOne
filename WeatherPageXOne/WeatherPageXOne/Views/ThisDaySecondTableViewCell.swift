//
//  ThisDayTableViewCell.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit

class ThisDaySecondTableViewCell: UITableViewCell {

    static let id = "ThisDaySecondTableViewCell"
    var collectionView: ThisDayCollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = UITableViewCell.SelectionStyle.none
        setCollectionView()
   }
    
    private func setCollectionView() {
        collectionView = ThisDayCollectionView()
        contentView.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 12.adjustSize()).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.adjustSize()).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.adjustSize()).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12.adjustSize()).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
