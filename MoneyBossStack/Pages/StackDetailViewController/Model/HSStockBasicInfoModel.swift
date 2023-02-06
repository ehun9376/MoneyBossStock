//
//  HSStockBasicInfoModel.swift
//  HSStockChartDemo
//
//  Created by Hanson on 16/9/5.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit
import SwiftyJSON

class HSStockBasicInfoModel: JsonModel {

    var stockName: String = ""
    
    var preClosePrice: CGFloat = 0
    
    required init(json: JBJson) {
        self.stockName = json["SZ300033"]["name"].stringValue
        self.preClosePrice = CGFloat(json["SZ300033"]["last_close"].doubleValue)
    }

}
