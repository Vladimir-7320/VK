//
//  FriendsPhotoViewController.swift
//  VK
//
//  Created by Владимир Харитонов on 18.04.2020.
//  Copyright © 2020 Mediasoft. All rights reserved.
//

import UIKit

class FriendsPhotoViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var friendsPhotoCollectionView: UICollectionView!
    
    // MARK: - Vars
    private let vkService = VKService()
    private var arrayvk = [FriendsPhotoObject]()
    // Segue information
    var friendsId = 0

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        vkService.loadFriendsPhoto(friendsId: friendsId) { (friendsPhoto) in
            self.arrayvk = friendsPhoto
            try? RealmProvider.save(items: friendsPhoto)
            self.reloadData()
        }
    }
    
    // MARK: - Functions
    private func reloadData() {
        self.friendsPhotoCollectionView.reloadData()
    }
}

    // MARK: - DataSource
extension FriendsPhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayvk.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotoCollectionCell", for: indexPath) as! FriendsPhotoCollectionViewCell
        let photosr = arrayvk[indexPath.row]
        cell.friendsPhoto.kf.setImage(with: URL(string: photosr.photo_604))
        
        return cell
    }
}
