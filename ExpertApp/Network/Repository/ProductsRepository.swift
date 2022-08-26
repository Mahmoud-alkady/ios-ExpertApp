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
        products?.append(ProductModel(id: 2, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 3, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 4, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 5, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 6, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 7, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))

        products?.append(ProductModel(id: 8, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 9, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        products?.append(ProductModel(id: 10, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))

        products?.append(ProductModel(id: 11, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))

        products?.append(ProductModel(id: 12, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))

        products?.append(ProductModel(id: 13, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))

        products?.append(ProductModel(id: 14, title: "Chicken", desc: "Large Strips", price: 100,  image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))

        products?.append(ProductModel(id: 15, title: "Chicken", desc: "Large Strips", price: 100, image: "https://assets.epicurious.com/photos/5732526f1877f76a0e20831c/1:1/w_2560%2Cc_limit/EP_05102016_PeruvianStyleRoastChicken_recipe_.jpg"))
        
        completion(self.products)
    }
}
