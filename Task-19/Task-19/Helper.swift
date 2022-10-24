//
//  Helper.swift
//  Task-19
//
//  Created by Егор Бадмаев on 24.10.2022.
//

import UIKit

/// Наследуемся от `NSObject`, т.к. иначе нельзя конформить `NSObjectProtocol`
final class Helper: NSObject {
    
    let data: [Flag]
    
    init(data: [Flag]) {
        self.data = data
    }
}

extension Helper: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionViewCell else { fatalError("Fatal error!")}
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
