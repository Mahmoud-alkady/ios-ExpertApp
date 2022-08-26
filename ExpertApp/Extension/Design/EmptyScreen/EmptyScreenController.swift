//
//  EmptyScreenController.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 26/08/2022.
//

import UIKit

let EMPTYSCREEN = EmptyScreenController.shared

class EmptyScreenController: UIViewController {
    
    static var shared = EmptyScreenController()

    @IBOutlet weak var emptyScreenImage: UIImageView!
    @IBOutlet weak var lblEmptyScreenTitle: UILabel!
    @IBOutlet weak var lblEmptyScreenDescription: UILabel!
    
    var type: EmptyScreenType = EmptyScreenType.cart
    var delegate: EmptyScreenControllerDelegate?
    var isPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        switch type {
        case .cart:
            setupCart()
            break
         }
    }
    
    func setup(_ title: String, _ description: String,_ imageKey: String) {
        emptyScreenImage.image = UIImage(named: imageKey)
        lblEmptyScreenTitle.text = title
        lblEmptyScreenDescription.text = description
    }
    
    func showAsSubView(_ view: UIView) {
        isPresented = true
        DispatchQueue.main.async {
            self.view.frame.size = view.frame.size
            view.addSubview(self.view)
        }
    }
    
    func close() {
        isPresented = false
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
        }
    }
    
}

// MARK: Setup Empty Screen With Different Types

extension EmptyScreenController {
    
    func setupCart() {
        setup("Your shopping cart is empty", "Be sure to fill your cart with product you need", "cartplaceholder")
    }
    
}
