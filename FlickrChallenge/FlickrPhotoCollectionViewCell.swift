//
//  FlickrPhotoCollectionViewCell.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit

class FlickrPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flickrImageView: UIImageView!
    static let nibName = "FlickrPhotoCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with photoModel: FlickrPhoto) {
        titleLabel.text = photoModel.title
    }
}
