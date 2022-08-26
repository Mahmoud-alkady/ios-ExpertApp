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
    
    var carts: [CartModel] = [] {
        didSet {
            NotificationCenter.default.post(name: didChangeProductCart, object: nil)
            checkCartDate()
        }
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
        cart.cartId = carts.count + 1
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
        self.carts = CartsManager().retrieve() ?? []
        completion(.onSuccess(carts))
    }
    
    func get(_ completion: @escaping (Response<[CartModel]?>) -> ()) {
        self.carts = CartsManager().retrieve() ?? []
        completion(.onSuccess(carts))
        completion(.onCompleted)
    }
    
    func delete(_ cartId: Int, _ completion: @escaping (Response<[CartModel]?>) -> ()) {
        CartsManager().delete(cartId)
        self.carts = CartsManager().retrieve() ?? []
        completion(.onSuccess(carts))
        completion(.onCompleted)
    }
    
    func checkCartDate() {
        for cart in carts {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm mm dd yyyy"
            guard let pastDate = dateFormatter.date(from: cart.date!) else {return}
            guard let currentDate = dateFormatter.date(from: getCurrentDate()) else {return}
            
            let countOfDays = Calendar.current.dateComponents([.day], from: pastDate, to: currentDate).day!

            if countOfDays > 3 {
                delete(cart.cartId!) { response in
                    switch response {
                    case .onSuccess(let carts):
                        self.carts = carts ?? []
                    case .onFailure:
                        break
                    case .onCompleted:
                        break
                    }
                }
            }
        }
    }
    
    func getCurrentDate() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm mm dd yyyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
