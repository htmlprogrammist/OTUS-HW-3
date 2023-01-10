//
//  SearchableViewController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

class SearchableViewController: ViewController {
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Что будем искать?"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = true
        return searchController
    }()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.sizeToFit()
        navigationItem.searchController = searchController
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: Notification.Name(rawValue: "updateTableViewNotification"), object: nil)
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "updateTableViewNotification"), object: nil)
    }
    
    func findItem(by text: String) {
    }
    
    @objc func updateTableView() {
        fetchData()
    }
    
    @objc func handleTapOnAvatarImageView() {
        present(avatarImagePicker, animated: true)
    }
}

extension SearchableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        findItem(by: searchBar.text ?? "")
    }
}

extension SearchableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

// MARK: - UIImagePickerControllerDelegate

extension SearchableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        defer {
            picker.dismiss(animated: true)
        }
        
        guard let image = info[.editedImage] as? UIImage else {
            print("Could not cast edited image to UIImage: \(String(describing: info[.editedImage]))")
            return
        }
        imageView.image = image
        
        guard let data = image.pngData() else {
            print("Could convert edited image in raw data: \(String(describing: image.pngData()))")
            return
        }
        UserDefaults.standard.set(data, forKey: "imageData")
    }
}
