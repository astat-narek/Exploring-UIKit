//
//  ViewController.swift
//  Collection View 01
//
//  Created by Narek Danielyan on 26.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    enum Section {
        case main
    }
    
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        collectionView.frame = view.frame
        collectionView.collectionViewLayout = configureLayout()
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.reuseIdentifier)
        configureDataSource()

        setupViews()
        layoutViews()
    }
    
    
    func configureLayout () -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section) 
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: self.collectionView) {
         (collectionView, indexPath, number) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reuseIdentifier, for: indexPath) as? NumberCell else {
                fatalError("Cannot create new cell")
            }
            cell.label.text = number.description
            
            return cell
        }
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(Array(1...100), toSection: .main)
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }

    
    private func setupViews() {
        view.addSubview(collectionView)
        
    }
    
    private func layoutViews() {

    }
    
}

