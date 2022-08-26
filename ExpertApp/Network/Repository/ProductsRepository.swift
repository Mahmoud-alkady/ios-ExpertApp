//
//  ProductsRepository.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 26/08/2022.
//

import UIKit

let PRODUCT = ProductsRepository.shared

class ProductsRepository {
    
    static let shared = ProductsRepository()
    
    var products: [ProductModel]? = []
    
    // MARK:- CALL APIs
    
    func getProducts(completion: @escaping ([ProductModel]?) -> ()) {
        
        products?.append(ProductModel(id: 1, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 2, title: "Meat", desc: "Large Shops", price: 150, image: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVhdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"))
        products?.append(ProductModel(id: 3, title: "Meats", desc: "Small Strips", price: 200,  image: "https://images.unsplash.com/photo-1600180786608-28d06391d25c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVhdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"))
        products?.append(ProductModel(id: 4, title: "American Meats", desc: "Stake", price: 330, image: "https://images.unsplash.com/photo-1592686092916-672fa9e86866?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWVhdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"))
        products?.append(ProductModel(id: 5, title: "Meats", desc: "One Stake", price: 90,  image: "https://images.unsplash.com/photo-1623241899289-e9a64b02150d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bWVhdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"))
        products?.append(ProductModel(id: 6, title: "Bufflo", desc: "Stake", price: 110, image: "https://images.unsplash.com/photo-1616252980327-ec70572e5df9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWVhdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"))
        products?.append(ProductModel(id: 7, title: "Chicken", desc: "Large", price: 140,  image: "https://images.unsplash.com/photo-1501200291289-c5a76c232e5f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hpY2tlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"))

        products?.append(ProductModel(id: 8, title: "Chicken", desc: "Strips", price: 160,  image: "https://images.unsplash.com/photo-1567620832903-9fc6debc209f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNoaWNrZW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"))
        products?.append(ProductModel(id: 9, title: "Chicken", desc: "One Piece", price: 250,  image: "https://images.unsplash.com/photo-1606728035253-49e8a23146de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y2hpY2tlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"))
        
        completion(self.products)
    }
}
