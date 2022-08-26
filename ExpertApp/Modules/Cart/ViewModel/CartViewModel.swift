//
//  CartViewModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import Foundation

class CartViewModel {
    
    var carts: [CartModel]?
    
    func getCarts(completion: @escaping ([CartModel]?) -> ()) {
        CART.get { response in
            switch response {
            case .onSuccess(let carts):
                completion(carts)
            case .onFailure, .onCompleted:
                break
            }
        }
    }
    
    func deleteCart(_ cartId: Int, completion: @escaping ([CartModel]?) -> ()) {
        CART.delete(cartId) { response in
            switch response {
            case .onSuccess(let carts):
                completion(carts)
            case .onFailure, .onCompleted:
                break
            }
        }
    }
    
}
