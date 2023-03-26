//
//  ViewController.swift
//  09 Caring collection
//
//  Created by Narek Danielyan on 26.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let data = Array(0...10)

    lazy var collectionView: UICollectionView = {
        let layout = SnappingFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.frame = view.frame
        view.addSubview(collectionView)
        collectionView.register(RectCell.self, forCellWithReuseIdentifier: RectCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
}


class SnappingFlowLayout: UICollectionViewFlowLayout {
    

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
            guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }

            var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x + sectionInset.left

            let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)

            let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)

            layoutAttributesArray?.forEach({ (layoutAttributes) in
                let itemOffset = layoutAttributes.frame.origin.x
                if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                    offsetAdjustment = itemOffset - horizontalOffset
                }
            })
            
        offsetAdjustment = offsetAdjustment - 10
        
            return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
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






