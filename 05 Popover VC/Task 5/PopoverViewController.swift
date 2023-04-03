//
//  PopoverViewController.swift
//  Task 5
//
//  Created by Narek Danielyan on 14.03.2023.
//
import UIKit


class PopoverNavigationController: UINavigationController, UIPopoverPresentationControllerDelegate {
    init(root: UIViewController, size: CGSize, sourceView: UIView, sourceRect: CGRect, direction: UIPopoverArrowDirection) {
        super.init (rootViewController: root)
        modalPresentationStyle = .popover
        preferredContentSize = size
        popoverPresentationController?.permittedArrowDirections = [direction]
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.sourceRect = sourceRect
        
        popoverPresentationController?.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
    }
    
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
}





class ChildController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        let segment = UISegmentedControl(items: ["280pt", "150pt" ])
        
        segment.addAction(.init(handler: { _ in
            self.navigationController?.preferredContentSize = .init(width: 300, height: segment.selectedSegmentIndex == 0 ? 280 : 150)
        }), for: .valueChanged)
        
        segment.selectedSegmentIndex = .zero
        
        navigationItem.titleView = segment
        
        navigationItem.rightBarButtonItem = .init(systemItem: .close, primaryAction: .init(handler: { _ in
            self.dismiss (animated: true)
        }))
        view.backgroundColor = .secondarySystemBackground
    }
}
