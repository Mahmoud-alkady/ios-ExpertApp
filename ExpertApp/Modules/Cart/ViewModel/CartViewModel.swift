//
//  CartViewModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 24/08/2022.
//

import Foundation

class CartViewModel {
        
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
    
}
