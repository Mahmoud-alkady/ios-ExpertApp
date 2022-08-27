//
//  CartRepository.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 26/08/2022.
//

import UIKit

let CART = CartRepository.shared

class CartRepository {
    
    static let shared = CartRepository()
    
    func observer(_ cartCount: Int) {
        NotificationCenter.default.post(name: didChangeProductCart, object: cartCount)
    }
    
    func sync() {
        get { response in
            switch response {
            case .onSuccess, .onCompleted:
                break
            case .onFailure:
                break
            }
        }
    }
    
    func setCartLocal(product: ProductModel) {
        var cart = CartModel()
        cart.cartId = (CartsManager().retrieve()?.count ?? 0) + 1
        cart.date = getCurrentDate()
        cart.product = product
        
        add(cart) { response in
            switch response {
            case .onSuccess, .onCompleted:
                self.showAddedBanner()
            case .onFailure:
                Banner.showError("Error")
            }
        }
    }
    
    private func showAddedBanner() {
        Banner.showSuccess("Product was added to cart")
    }
}

// MARK: API Functions

extension CartRepository {
    
    func add(_ cart: CartModel, _ completion: @escaping (Response<[CartModel]>) -> ()) {
        _ = CartsManager().store(cart)
        completion(.onSuccess(checkCartDate()))
    }
    
    func get(_ completion: @escaping (Response<[CartModel]?>) -> ()) {
        completion(.onSuccess(checkCartDate()))
    }
    
    func delete(_ cartId: Int, _ completion: @escaping (Response<[CartModel]?>) -> ()) {
        CartsManager().delete(cartId)
        completion(.onSuccess(checkCartDate()))
    }
    
    func checkCartDate() -> [CartModel] {
        for cart in CartsManager().retrieve() ?? [] {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm mm dd yyyy"
            if let pastDate = dateFormatter.date(from: cart.date!) {
                if let currentDate = dateFormatter.date(from: getCurrentDate()) {
                    let countOfDays = Calendar.current.dateComponents([.day], from: pastDate, to: currentDate).day!

                    if countOfDays > 3 {
                        delete(cart.cartId!) { response in
                            switch response {
                            case .onSuccess, .onFailure, .onCompleted:
                                break
                            }
                        }
                    }
                }
            }
        }
        let carts = CartsManager().retrieve() ?? []
        observer(carts.count)
        return carts
    }
    
    func getCurrentDate() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm mm dd yyyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
