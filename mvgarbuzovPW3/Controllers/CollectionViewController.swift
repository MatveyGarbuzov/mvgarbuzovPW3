//
//  CollectionViewController.swift
//  mvgarbuzovPW3
//
//  Created by Matvey Garbuzov on 24.10.2021.
//

import UIKit

class CollectionViewController: UIViewController {
    private var collection:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(
            top: 20, left: 10, bottom: 10, right: 10
        )
        layoutFlow.itemSize = CGSize(width: 60, height: 60)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .purple
    }
}
