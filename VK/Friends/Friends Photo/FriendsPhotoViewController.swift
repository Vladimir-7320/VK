//
//  FriendsPhotoViewController.swift
//  VK
//
//  Created by Владимир Харитонов on 18.04.2020.
//  Copyright © 2020 Mediasoft. All rights reserved.
//

import UIKit

class FriendsPhotoViewController: UIViewController {
    
    @IBOutlet weak var friendsPhotoCollectionView: UICollectionView!
    private let vkService = VKService()
    private var arrayvk = [FriendsPhotoObject]()
    
    
    // Segue information
    var friendsId = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        vkService.loadFriendsPhoto(friendsId: friendsId) { (friendsPhoto) in
            self.arrayvk = friendsPhoto
            try? RealmProvider.save(items: friendsPhoto)
            
            // Обновление данных в таблице
            self.friendsPhotoCollectionView.reloadData()
        }
    }
    
    
    
}

extension FriendsPhotoViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayvk.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotoCollectionCell", for: indexPath) as! FriendsPhotoCollectionViewCell
        let photos = arrayvk[indexPath.row]
        cell.friendsPhoto.kf.setImage(with: URL(string: photos.photo_604))
        
        return cell
    }
}
