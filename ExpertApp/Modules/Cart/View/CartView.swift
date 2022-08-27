//
//  CartView.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

class CartView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cart"
        initTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCarts {
            self.reloadTableView()
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [self] in
            if viewModel.carts?.isEmpty ?? false {
                EMPTYSCREEN.showAsSubView(view)
            } else {
                EMPTYSCREEN.close()
                tableView.reloadData()
            }
        }
    }
}

// MARK: - Delegate

extension CartView: CartDelegate {
    
    func didClickToDeleteProduct(_ cartId: Int) {
        viewModel.deleteCart(cartId) {
            self.reloadTableView()
        }
    }
}

// MARK: - Nav

extension CartView {
    static func assembleModule() -> UIViewController {
        let view: CartView = UIStoryboard(name: "CartView", bundle: nil).instantiateViewController(withIdentifier: "CartView") as! CartView
        return UINavigationController(rootViewController: view)
    }
}

