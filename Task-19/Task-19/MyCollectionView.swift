//
//  MyCollectionView.swift
//  Task-19
//
//  Created by Егор Бадмаев on 24.10.2022.
//

import UIKit

final class MyCollectionView: UICollectionView {
    
    let data: [Flag]
    
    init(data: [Flag], width: CGFloat) {
        self.data = data
        // Custom Flow Layout
        let availableWidth = width - (16 * 2) - (16 * 2)
        let itemWidth = availableWidth / 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionViewCell else { fatalError("Fatal error!")}
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
