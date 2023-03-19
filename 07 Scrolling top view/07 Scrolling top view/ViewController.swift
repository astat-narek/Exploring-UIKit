//
//  ViewController.swift
//  07 Scrolling top view
//
//  Created by Narek Danielyan on 19.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let imageView = UIImageView(image: UIImage(named: "bg"))
    let scrollView = UIScrollView()
    
    let imageHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        scrollView.delegate = self
        scrollView.frame = CGRect(origin: .zero, size: view.frame.size)
        scrollView.contentSize = CGSize(
            width: view.bounds.width,
            height: view.bounds.height + imageHeight)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.indicatorStyle = .black
        scrollView.contentOffset.y = 0
        
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: imageHeight)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: view.bounds.width, height: imageHeight - scrollView.contentOffset.y)
        }
        
        if scrollView.contentOffset.y > 0 {
            imageView.frame = CGRect(x: 0, y: -scrollView.contentOffset.y, width: view.bounds.width, height: imageHeight)
        }
        
        let indicatorInset = imageHeight - scrollView.contentOffset.y - view.safeAreaInsets.top
        
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: max(imageHeight,indicatorInset), left: 0, bottom: 0, right: 0)
    }
}
