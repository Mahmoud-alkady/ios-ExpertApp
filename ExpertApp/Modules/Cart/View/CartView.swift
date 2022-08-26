//
//  CartView.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 24/08/2022.
//

import UIKit

class CartView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CartViewModel()
    var carts: [CartModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cart"
        initTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCarts { carts in
            self.carts = carts
            self.reloadTableView()
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [self] in
            if self.carts?.isEmpty ?? false {
                EMPTYSCREEN.showAsSubView(view)
            } else {
                EMPTYSCREEN.close()
                tableView.reloadData()
            }
        }
    }
}

extension CartView {
    static func assembleModule() -> UIViewController {
        let view: CartView = UIStoryboard(name: "CartView", bundle: nil).instantiateViewController(withIdentifier: "CartView") as! CartView
        return UINavigationController(rootViewController: view)
    }
}
