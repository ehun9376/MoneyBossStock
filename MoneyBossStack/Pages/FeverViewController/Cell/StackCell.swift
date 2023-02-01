//
//  StackCell.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit

class StackCellRowModel: CellRowModel {
    
    override func cellReUseID() -> String {
        return "StackCell"
    }
    
    var title: String?
    
    var subTitle: String?
    
    var newPrice: Int?
    
    var compare: Int?
    
    var percent: Int?
    
    init(
        title: String? = nil,
        subTitle: String? = nil,
        newPrice: Int? = nil,
        compare: Int? = nil,
        percent: Int? = nil,
        cellDidSelect: ((CellRowModel)->())?
    ) {
        super.init()
        self.title = title
        self.subTitle = subTitle
        self.newPrice = newPrice
        self.compare = compare
        self.percent = percent
        self.cellDidSelect = cellDidSelect
    }

}

class StackCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var newPriceLabel: UILabel!
    
    @IBOutlet weak var compareLabel: UILabel!
    
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var arrowLabel: UILabel!
    
    override func awakeFromNib() {
        
        self.selectionStyle = .none
        
        self.titleLabel.font = .systemFont(ofSize: 18)
        self.titleLabel.textColor = .black
        
        self.subTitleLabel.font = .systemFont(ofSize: 14)
        self.subTitleLabel.textColor = .gray
        
        self.newPriceLabel.font = .systemFont(ofSize: 18)
        
        self.compareLabel.font = .systemFont(ofSize: 18)
        
        self.percentLabel.font = .systemFont(ofSize: 18)
        
        self.arrowLabel.font = .systemFont(ofSize: 18, weight: .heavy)
        self.arrowLabel.text = ">"
    }
    
}

extension StackCell: BaseCellView {
    func setupCellView(model: BaseCellModel) {
        guard let rowModel = model as? StackCellRowModel else { return }
        
        self.titleLabel.text = rowModel.title
        
        self.subTitleLabel.text = rowModel.subTitle
        
        self.newPriceLabel.text = "\(rowModel.newPrice ?? 0)"
        
        self.compareLabel.text = "\(rowModel.compare ?? 0)"
        
        self.percentLabel.text = "\(rowModel.percent ?? 0)%"
        
        var upOrDownColor: UIColor = .red
        
        if rowModel.compare ?? 0 > 0 {
            upOrDownColor = .red
        } else if rowModel.compare ?? 0 < 0 {
            upOrDownColor = .green
        } else {
            upOrDownColor = .black
        }
        
        self.newPriceLabel.textColor = upOrDownColor
        
        self.compareLabel.textColor = upOrDownColor
        
        self.percentLabel.textColor = upOrDownColor
    }
    
    
}
