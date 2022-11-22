//
//  ThisDayCollectionView.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 22.11.22.
//

import UIKit

class ThisDayCollectionView: UICollectionView {
    
    var thisDayWeatherArray = [WeatherPerDay]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
        register(ThisDayCollectionViewCell.self, forCellWithReuseIdentifier: ThisDayCollectionViewCell.id)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ThisDayCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        thisDayWeatherArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: ThisDayCollectionViewCell.id, for: indexPath) as? ThisDayCollectionViewCell else { return UICollectionViewCell() }
        if thisDayWeatherArray.count > indexPath.row {
            cell.configure(thisDayWeatherArray[indexPath.row] )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = thisDayWeatherArray[indexPath.row].temperature != "Заход солнца" ? 51.adjustSize() : 153.adjustSize()
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    
}
