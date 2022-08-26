//
//  HomeView+TableView.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 24/08/2022.
//
import UIKit

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        tableView.initialize(cellClass: ProductHorizontalCell.self, delegate: self, dataSource: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: ProductHorizontalCell.self)
        cell.product = products?[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}