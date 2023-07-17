//
//  FlickrPhotoCollectionViewCell.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit
import SDWebImage

class FlickrPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flickrImageView: UIImageView!
    static let reuseIdentifier = "FlickrPhotoCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with photoModel: FlickrPhoto) {
        titleLabel.text = photoModel.title
        flickrImageView.sd_setImage(with: URL(string: photoModel.urlT), placeholderImage: UIImage(named: ""))
    }
}
