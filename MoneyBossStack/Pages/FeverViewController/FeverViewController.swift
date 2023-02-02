//
//  FeverViewController.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit

class FeverViewController: BaseTableViewController {
    
    var viewModel: FeverViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regisCellID(cellIDs: [
            "StackCell"
        ])
        
        self.title = "熱門商品行情"
        
        self.viewModel = .init(tableView: self.defaultTableView, delegate: self)
        self.viewModel?.getStack()
    }

    
}

extension FeverViewController: FeverMethod {
    
    func cellDidPressed(model: BaseCellModel) {
        guard let rowModel = model as? StackCellRowModel else { return }
        let vc = StackDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print(rowModel.title ?? "")
    }
    
}

