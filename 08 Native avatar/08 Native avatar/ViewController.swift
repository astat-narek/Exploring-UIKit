//
//  ViewController.swift
//  08 Native avatar
//
//  Created by Narek Danielyan on 22.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    let avatar = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    let newLargeTitleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Avatar"
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        scrollView.contentSize = view.frame.size
        scrollView.frame = CGRect(origin: .zero, size: view.frame.size)

        avatar.tintColor = .lightGray
        
        view.addSubview(scrollView)
        newLargeTitleView.addSubview(avatar)
        newLargeTitleView.translatesAutoresizingMaskIntoConstraints = false
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.trailingAnchor.constraint(equalTo: newLargeTitleView.trailingAnchor),
            avatar.heightAnchor.constraint(equalToConstant: 36),
            avatar.widthAnchor.constraint(equalToConstant: 36),
            avatar.centerYAnchor.constraint(equalTo: newLargeTitleView.centerYAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                if let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type {
                    if let largeTitleView = self.findSubview(parentView: self.navigationController!.view, type: largeTitleClass) {
                        largeTitleView.addSubview(self.newLargeTitleView)
                        
                        NSLayoutConstraint.activate([
                            self.newLargeTitleView.bottomAnchor.constraint(equalTo: largeTitleView.safeAreaLayoutGuide.bottomAnchor),
                            self.newLargeTitleView.heightAnchor.constraint(equalToConstant: 52),
                            self.newLargeTitleView.widthAnchor.constraint(equalToConstant: 52),
                            self.newLargeTitleView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -8 ),

                        ])
                    }
                }
            }
    }
        
  
    
    func findSubview(parentView: UIView, type: UIView.Type) -> UIView? {
        for subview in parentView.subviews {
            if subview.isKind(of: type) {
                return subview
            } else if let desiredInstance = findSubview(parentView: subview, type: type) {
                return desiredInstance
            }
        }
        return nil
     }
}
