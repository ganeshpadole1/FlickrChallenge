//
//  FlickrSearchViewController.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit

class FlickrSearchViewController: UIViewController {

    private var viewModel = FlickrViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        viewModel.search(text: "garden") {
            print("search completed.")
        }
        
        viewModelClosures()
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
