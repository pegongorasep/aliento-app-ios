//
//  GalleryDetailVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/06/23.
//

import UIKit
import Resolver

class GalleryDetailVC : UIViewController {
    var item : GalleryPresentation? = nil
    
    @IBOutlet var galleryDetailCollectionView: GalleryDetailCollectionView!
    @IBOutlet var titleDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = item else { return }
        
        titleDetailLabel.text = item.name
        
        galleryDetailCollectionView.register(UINib(nibName: GalleryDetailItemCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryDetailItemCell.identifier)
        galleryDetailCollectionView.dataSource = galleryDetailCollectionView
        galleryDetailCollectionView.delegate = galleryDetailCollectionView
        galleryDetailCollectionView.onClick = { item in
            let controller = FullScreenImageVC(imageUrl: item)
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: false, completion: nil)
        }
        galleryDetailCollectionView.galleryDetailCollectionView = item.images
        galleryDetailCollectionView.reloadData()
    }
    
    @objc func goToGalleryDetails() {
        let galleryDetails = GalleryDetailVC()
        galleryDetails.modalPresentationStyle = .popover
        self.present(galleryDetails, animated: true, completion: nil)
    }
    
    static func create(item : GalleryPresentation) -> GalleryDetailVC {
        let viewController = GalleryDetailVC()
        viewController.item = item
        return viewController
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // guard let item = item else { return }
        //item.images.map { imageName in LightboxImage(imageURL: URL(string: imageName)!) }
      
    }
}