//
//  CartModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import Foundation

struct CartModel: Codable {
    var cartId: Int?
    var date: String?
    var product: ProductModel?
}

extension CartModel {
    
    enum CodingKeys: String, CodingKey {
        
        case cartId
        case date
        case product
        
    }
}
