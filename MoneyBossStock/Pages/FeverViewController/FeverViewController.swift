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
        let vc = StockDetailViewController(stockID: rowModel.title)
        self.navigationController?.pushViewController(vc, animated: true)
        print(rowModel.title ?? "")
    }
    func scrollViewDidScroll(offset: CGFloat) {
        
        var color: UIColor = .white

        if (offset > 0) {
            color = .blue
        } else {
            color = .gray
        }
        if #available(iOS 13.0, *) {
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = color
            barAppearance.shadowColor = .clear
            barAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14,weight: .bold),NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationItem.standardAppearance = barAppearance
            navigationItem.scrollEdgeAppearance = barAppearance
        }
    }
    
}

