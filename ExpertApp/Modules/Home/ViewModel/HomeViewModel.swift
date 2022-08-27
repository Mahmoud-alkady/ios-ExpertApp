//
//  HomeViewModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import Foundation

class HomeViewModel {
    
    var products: [ProductModel]?
    
    func getProducts(completion: @escaping () -> ()) {
        PRODUCT.getProducts { products in
            self.products = products
            completion()
        }
    }
    
    func addToCart(_ product: ProductModel) {
        CART.setCartLocal(product: product)
    }
   
    func getCart() {
        CART.sync()
    }
    
}
