//
//  RocketListViewController.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import UIKit

final class RocketListViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    
    private let presenter: RocketListViewOutput
    private var rockets = [Rocket]()
    
    // MARK: - Init
    
    init(presenter: RocketListViewOutput) {
        self.presenter = presenter
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Rockets"
        view.backgroundColor = .systemBackground
        collectionView.backgroundColor = .clear
        collectionView.register(RocketsCollectionViewCell.self, forCellWithReuseIdentifier: RocketsCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        
        presenter.viewDidLoad()
    }
}

extension RocketListViewController: RocketListViewInput {
    func showData(data: [Rocket]) {
        rockets = data
        print(data)
        collectionView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        alertForError(title: title, message: message)
    }
}

// MARK: - UICollectionView
extension RocketListViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rockets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketsCollectionViewCell.identifier, for: indexPath) as? RocketsCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(rocket: rockets[indexPath.row])
        cell.clipsToBounds = false
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelect(rocket: rockets[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 18, bottom: 30, right: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width - 2 * 18
        let height = width * 0.79
        return CGSize(width: width, height: height)
    }
}
