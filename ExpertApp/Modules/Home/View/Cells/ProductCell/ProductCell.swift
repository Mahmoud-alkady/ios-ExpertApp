//
//  ProductCell.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewContainerImg: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
   
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var viewCart: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var delegate: HomeDelegate? = nil
    
    var product: ProductModel? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell() {
        imgProduct.loadImage(product?.image)
        lblTitle.text = product?.title
        lblDesc.text = product?.desc
        lblPrice.text = "\(product?.price ?? 0)"
    }
    
    @IBAction func cartAction(_ sender: Any) {
        delegate?.didPressAddToCart(product!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
