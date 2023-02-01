//
//  FeverViewModel.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit

protocol FeverMethod {
    func cellDidPressed(model: BaseCellModel)
}

class FeverViewModel {
    
    var adapter: TableViewAdapter?
    
    var delegate: FeverMethod?
    
    var stackModels: [StackModel] = [] {
        didSet {
            self.setupRow()
        }
    }
    
    init(
        tableView: UITableView,
        delegate: FeverMethod
    ){
        self.adapter = .init(tableView)
        self.delegate = delegate
    }
    
    func getStack() {
        self.stackModels = [
            StackModel(name: "AAPL", subName: "ss", lastPrice: 0, nowPrice: 0),
            StackModel(name: "ssss", subName: "tttt", lastPrice: 0, nowPrice: 0),
            StackModel(name: "hhhh", subName: "ssss", lastPrice: 0, nowPrice: 0),
            StackModel(name: "gggg", subName: "hhhh", lastPrice: 0, nowPrice: 0)
        ]
    }
    
    func setupRow() {
        
        var rowModels: [CellRowModel] = []
        
        for model in self.stackModels {
            let rowModel = StackCellRowModel(title: model.name,
                                             subTitle: model.subName,
                                             newPrice: 0,
                                             compare: 0,
                                             percent: 0,
                                             cellDidSelect: { [weak self] rowModel in
                self?.delegate?.cellDidPressed(model: rowModel)
                
            })
            rowModels.append(rowModel)
        }
        
        self.adapter?.updateTableViewData(rowModels: rowModels)

        
    }
}