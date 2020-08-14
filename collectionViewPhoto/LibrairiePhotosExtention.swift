//
//  LibrairiePhotosExtention.swift
//  collectionViewPhoto
//
//  Created by Philippe MICHEL on 13/08/2020.
//  Copyright © 2020 Philippe MICHEL. All rights reserved.
//

import UIKit
import Photos
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return 1
    //}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CellulePeso {
            
            let asset = self.listePhotos[indexPath.row]
            let manager = PHImageManager.default()
            
            manager.requestImage(for: asset, targetSize: CGSize(width: 65, height: 65), contentMode: .aspectFill, options: nil) { (image, _) in
                DispatchQueue.main.async {
                    cell.Photos.image = image
                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

