//
//  CartsManager.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 26/08/2022.
//

import UIKit
import CoreData

class CartsManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    
    init() {
        let persistentContainer = appDelegate.persistentContainer
        context = persistentContainer.viewContext
    }
    
    func store(_ model: CartModel) -> Carts? {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Carts", into: context!) as! Carts
        
        entity.setValue(model.cartId, forKey: "cartId")
        entity.setValue(model.date, forKey: "date")
        entity.setValue(model.product?.price, forKey: "productPrice")
        entity.setValue(model.product?.price, forKey: "productPrice")
        entity.setValue(model.product?.id, forKey: "productId")
        entity.setValue(model.product?.title, forKey: "productTitle")
        entity.setValue(model.product?.image, forKey: "productImage")
        entity.setValue(model.product?.desc, forKey: "productDesc")
        
        do {
            try context?.save()
            return entity
        } catch let error {
            print("Could not store \(error.localizedDescription)")
            return nil
        }
    }
    
    func retrieve() -> [CartModel]? {
        let fetchRequest = NSFetchRequest<Carts>(entityName: "Carts")
        do {
            let results = try context?.fetch(fetchRequest)
            guard let data = results, !data.isEmpty else {
                return []
            }
            return mapData(data)
        } catch let error {
            print("Could not retrieve \(error.localizedDescription)")
            return nil
        }
    }
    
    func mapData(_ entities: [Carts]) -> [CartModel] {
        var models: [CartModel] = []
        
        for entity in entities {
            
            var model: CartModel = CartModel()
            model.product = ProductModel()
            model.cartId = Int(entity.cartId)
            model.date = entity.date ??  ""
            model.product?.id = Int(entity.productId)
            model.product!.title = entity.productTitle ?? ""
            model.product?.image = entity.productImage ?? ""
            model.product?.desc = entity.productDesc
            model.product?.price = entity.productPrice
            
            models.append(model)
        }
        return models
    }
    
    func deleteAll() {
        if let result = try? context?.fetch(Carts.fetchRequest()) {
            for object in result {
                context?.delete(object)
            }
        }
    }
    
    func delete(_ productId: Int) {
        if let result = try? context?.fetch(Carts.fetchRequest()) {
            for object in result {
                if object.productId == productId {
                    context?.delete(object)
                }
            }
        }
    }
    
}
