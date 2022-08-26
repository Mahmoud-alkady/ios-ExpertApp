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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
