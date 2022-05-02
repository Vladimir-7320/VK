//
//  PhotoViewController.swift
//  VK
//
//  Created by Владимир on 04/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var photoCollectionView: UICollectionView!
    
    // MARK: - Vars
    private let vkService = VKService()
    private var photos: Results<PhotoObject>?
    private var tokenNotificationPhoto: NotificationToken?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        pairTableAndRealm()
        vkService.loadPhotos { (photos) in
            try? RealmProvider.save(items: photos)
        }
    }
    
    // MARK: - Functions
    // Realm notifications
    private func pairTableAndRealm() {
        guard let realm = try? Realm() else { return }
        photos = realm.objects(PhotoObject.self)
        
        self.tokenNotificationPhoto = photos?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.photoCollectionView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self?.photoCollectionView.performBatchUpdates({
                    self?.photoCollectionView.insertItems(at: insertions.map({IndexPath(row: $0, section: 0)}))
                    self?.photoCollectionView.deleteItems(at: deletions.map({IndexPath(row: $0, section: 0)}))
                    self?.photoCollectionView.reloadItems(at: modifications.map({IndexPath(row: $0, section: 0)}))
                }, completion: nil)
            case .error(let error):
                print(error)
            }
        }
    }
}

// MARK: - DataSource
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCell", for: indexPath) as! PhotoCollectionCell
        
        guard let photo = photos?[indexPath.row] else { return cell }
        cell.configure(photo: photo)
        
        return cell
    }
}

