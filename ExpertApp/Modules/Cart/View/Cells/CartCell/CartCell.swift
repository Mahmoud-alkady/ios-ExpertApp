//
//  CartCell.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewContainerImg: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var delegate: CartDelegate?
    
    var cart: CartModel? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell() {
        imgProduct.loadImage(cart?.product?.image)
        lblTitle.text = cart?.product?.title
        lblDesc.text = cart?.product?.desc
        lblPrice.text = "\(cart?.product?.price ?? 0) LE"
    }
    
    @IBAction func actionDelete(_ sender: Any) {
        delegate?.didClickToDeleteProduct(cart!.cartId!)
    }
    
}
