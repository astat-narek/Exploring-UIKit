//
//  ViewController.swift
//  09 Caring collection
//
//  Created by Narek Danielyan on 26.03.2023.
//

import UIKit


class ViewController: UIViewController {
    
    let data = Array(0...10)
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: SnappingFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.frame = view.frame
        view.addSubview(collectionView)
        collectionView.register(RectCell.self, forCellWithReuseIdentifier: RectCell.reuseIdentifier)
        collectionView.preservesSuperviewLayoutMargins = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


class SnappingFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        itemSize = . init(width: 280, height: 400)
        sectionInsetReference = .fromLayoutMargins
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        
        let horizontalOffset = proposedContentOffset.x
        
        let targetRect = CGRect.init(origin: .init(x: proposedContentOffset.x, y: 0), size: collectionView.bounds.size)
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        for layoutAttributes in super.layoutAttributesForElements(in: targetRect)! {
            let itemOffset = layoutAttributes.frame.origin.x
            if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        }
        return CGPoint.init(x: proposedContentOffset.x + offsetAdjustment - collectionView.layoutMargins.left, y: proposedContentOffset.y)
    }
    
}


// MARK: - Collection View Delegate
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 400)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}

// MARK: - Collection View Data Source
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RectCell.reuseIdentifier, for: indexPath) as? RectCell else {
            fatalError("Cell cannot be created")
        }
        return cell
    }
}






