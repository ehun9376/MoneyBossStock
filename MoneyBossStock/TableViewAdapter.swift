//
//  TableViewAdapter.swift
//  Pet
//
//  Created by 陳逸煌 on 2022/7/12.
//

import Foundation
import UIKit

public class TableViewAdapter: NSObject {
    
    public var tableView: UITableView?
    
    public var rowModels: [CellRowModel] = []
    
    public var reachBottomAction: ((IndexPath) -> ())?
    
    public init(_ tableView: UITableView){
        super.init()
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
    public func updateTableViewData(rowModels : [CellRowModel]) {
        
        self.rowModels = rowModels
        
        DispatchQueue.main.async {
            self.tableView?.reloadData()

        }
    }
    
    public func insertRowsAtLast(rowModels : [CellRowModel]) {
        for rowModel in rowModels {
            self.rowModels.append(rowModel)
            let indexPath = IndexPath(row: self.rowModels.count, section: 0)
            self.tableView?.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
}
extension TableViewAdapter: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowModels.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.rowModels[indexPath.row].indexPath = indexPath
        self.rowModels[indexPath.row].tableView = tableView
        let rowModel = self.rowModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: rowModel.cellReUseID(), for: indexPath)
        if let cell = cell as? BaseCellView {
            cell.setupCellView(model: rowModel)
        }
        
        //如果顯示出來的是最後一個，就執行到底的Action
        if self.rowModels.count - 1 == indexPath.row, let reachBottomAction = self.reachBottomAction {
            reachBottomAction(indexPath)
        }
        return cell
    }
    
    
}
extension TableViewAdapter: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowModel = self.rowModels[indexPath.row]
        if let action = rowModel.cellDidSelect {
            action(rowModel)
        }
    }
}
