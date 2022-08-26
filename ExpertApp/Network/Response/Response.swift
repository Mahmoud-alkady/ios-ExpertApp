//
//  Response.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 26/08/2022.
//

import Foundation

enum Response<T> {

    case onSuccess(T)
    case onFailure
    case onCompleted
}
