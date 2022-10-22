//
//  ViewController.swift
//  Task-19
//
//  Created by Егор Бадмаев on 23.10.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let flags = [Flag(name: "Дания", image: UIImage(named: "dk")!),
                         Flag(name: "Аргентина", image: UIImage(named: "ar")!),
                         Flag(name: "Бельгия", image: UIImage(named: "be")!),
                         Flag(name: "Австрия", image: UIImage(named: "at")!),
                         Flag(name: "Австралия", image: UIImage(named: "au")!),
                         Flag(name: "Болгария", image: UIImage(named: "bg")!),
                         Flag(name: "Бахрейн", image: UIImage(named: "bh")!),
                         Flag(name: "Бразилия", image: UIImage(named: "br")!),
                         Flag(name: "Швейцария", image: UIImage(named: "ch")!),
                         Flag(name: "Чехия", image: UIImage(named: "cz")!),
                         Flag(name: "Германия", image: UIImage(named: "de")!),
                         Flag(name: "Испания", image: UIImage(named: "es")!)]
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createTwoColumnFlowLayout())
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Флаги"
        
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let availableWidth = width - (view.layoutMargins.left * 2) - (view.layoutMargins.right * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionViewCell else { fatalError("Fatal error!")}
        cell.configure(with: flags[indexPath.row])
        return cell
    }
}
