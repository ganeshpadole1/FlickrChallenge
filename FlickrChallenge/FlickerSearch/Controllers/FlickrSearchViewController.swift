//
//  FlickrSearchViewController.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit

class FlickrSearchViewController: UIViewController {

    private var viewModel = FlickrViewModel()
    private var searchBarController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flickr Challenge"
        view.backgroundColor = .cyan
       
        addSearchBar()
        viewModelClosures()
    }
}

extension FlickrSearchViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func addSearchBar() {
        searchBarController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchBarController
        searchBarController.delegate = self
        searchBarController.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, text.count > 1 else {
            return
        }
        
        viewModel.search(text: text) {
            print("user search completed.")
        }
        
        searchBarController.searchBar.resignFirstResponder()
    }
}

//MARK:- Clousers
extension FlickrSearchViewController {
    
    fileprivate func viewModelClosures() {
        
        viewModel.showAlert = { [weak self] (message) in
           
        }
        
        viewModel.dataUpdated = { [weak self] in
            print("data source updated")
          
        }
    }
}
