//
//  HomeView.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 24/08/2022.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()
    var products: [ProductModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        initTableView()
        getData()
    }
    
    func getData() {
        getProducts()
        getCart()
    }
    
    func getProducts() {
        viewModel.getProducts { products in
            self.products = products
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
    
    func getCart() {
        viewModel.getCart()
    }
    
}

// Assemble Module

extension HomeView {
    static func assembleModule() -> UIViewController {
        let view: HomeView = UIStoryboard(name: "HomeView", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as! HomeView
       
        return UINavigationController(rootViewController: view)
    }
}


// MARK:- Home Delegate

extension HomeView: HomeDelegate {
    
    func didPressAddToCart(_ product: ProductModel) {
        viewModel.addToCart(product)
    }
}