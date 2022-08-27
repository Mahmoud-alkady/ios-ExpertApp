//
//  CartViewModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import Foundation

class CartViewModel {
    
    var carts: [CartModel]?
    
    func getCarts(completion: @escaping () -> ()) {
        CART.get { response in
            switch response {
            case .onSuccess(let carts):
                self.carts = carts
            case .onFailure, .onCompleted:
                break
            }
            completion()
        }
    }
    
    func deleteCart(_ cartId: Int, completion: @escaping () -> ()) {
        CART.delete(cartId) { response in
            switch response {
            case .onSuccess(let carts):
                self.carts = carts
            case .onFailure, .onCompleted:
                break
            }
            completion()
        }
    }
    
}
