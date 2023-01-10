//
//  VideoSermonItemCell.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

class VideoSermonItemCell: UICollectionViewCell {
    static let identifier = "VideoSermonItemCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var background: UIView!
    
    var item: SermonVideo? = nil
    
    func configure(item: SermonVideo) {
        self.item = item
        
        nameLabel.text = item.name
        durationLabel.text = "\(item.phrase)"
        imageView.load(url: item.imageUrl)
        
        background.layer.cornerRadius = 16
        background.addShadow()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Se presiono \(item?.name)")
    }
        
}
