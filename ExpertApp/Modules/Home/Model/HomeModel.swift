//
//  HomeModel.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 24/08/2022.
//

import Foundation

struct ProductModel: Codable {
    
    var id: Int = 0
    var title: String = ""
    var desc: String? = ""
    var price: Double? = 0.0
    var image: String?
    
}

extension ProductModel {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case desc
        case price
        case image
    }
}
