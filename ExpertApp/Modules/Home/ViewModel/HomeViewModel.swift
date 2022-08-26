//
//  HomeViewModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 24/08/2022.
//

import Foundation

class HomeViewModel {
        
    func getProducts(completion: @escaping ([ProductModel]?) -> ()) {
        PRODUCT.getProducts { products in
            completion(products)
        }
    }
    
    func addToCart(_ product: ProductModel) {
        CART.setCartLocal(product: product)
    }
   
    func getCart() {
        CART.sync()
    }
    
}
