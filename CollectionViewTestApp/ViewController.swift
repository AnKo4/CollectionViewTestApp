//
//  ViewController.swift
//  CollectionViewTestApp
//
//  Created by Andrey on 09.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = "\(indexPath.item)"
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0: return CGSize(width: collectionView.frame.width * 0.6, height: collectionView.frame.height)
        case 1,2: return CGSize(width: collectionView.frame.width * 0.4, height: collectionView.frame.height * 0.5)
        default: return CGSize(width: collectionView.frame.width * 0.5, height: collectionView.frame.height * 0.5)
        }
    }
}
