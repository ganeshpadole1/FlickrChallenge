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
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flickr Challenge"
       
        addSearchBar()
        configureUI()
        viewModelClosures()
    }
    
    func configureUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib: FlickrPhotoCollectionViewCell.nibName)

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
            self?.collectionView.reloadData()
        }
    }
}

//MARK:- UICollectionViewDataSource
extension FlickrSearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrPhotoCollectionViewCell.nibName, for: indexPath) as! FlickrPhotoCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? FlickrPhotoCollectionViewCell else {
            return
        }
        
        let model = viewModel.photoArray[indexPath.row]
        cell.configure(with: model)
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension FlickrSearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width)/2, height: (collectionView.bounds.width)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//MARK:- UICollectionView
extension UICollectionView {
    func register(nib nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}



