//
//  ViewController.swift
//  collectionViewPhoto
//
//  Created by Philippe MICHEL on 13/08/2020.
//  Copyright © 2020 Philippe MICHEL. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    var listePhotos = [PHAsset]()
    
    @IBOutlet weak var vueLibrairiePhoto: UIView!
    @IBOutlet weak var librairiePhotos: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        librairiePhotos.dataSource = self
        librairiePhotos.delegate = self
        populatePhotos()
    }

    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func populatePhotos() {
        
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            if status == .authorized {
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { (object,_, _) in
                    print(object)
                    self?.listePhotos.append(object)
                    self?.listePhotos.reverse()
                    self?.librairiePhotos.reloadData()
                }
            }
        }
    }
}

