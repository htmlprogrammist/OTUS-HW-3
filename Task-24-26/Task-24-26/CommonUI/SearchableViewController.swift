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
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "updateTableViewNotification"), object: nil)
    }
    
    func findItem(by text: String) {
    }
    
    @objc func updateTableView() {
        fetchData()
    }
}

extension SearchableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        findItem(by: searchBar.text ?? "")
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
