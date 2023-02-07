//
//  StackModel.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation

class StockModel: JsonModel {
    
    var name: String?
    
    var subName: String?
    
    var lastPrice: Int?
    
    var nowPrice: Int?
    
    required init(json: JBJson) {
        self.name = json["name"].stringValue
        self.subName = json["subName"].stringValue
        self.lastPrice = json["lastPrice"].intValue
        self.nowPrice = json["nowPrice"].intValue
    }
    
    required init(
        name: String?,
        subName: String?,
        lastPrice: Int?,
        nowPrice: Int?
    ) {
        self.name = name
        self.subName = subName
        self.lastPrice = lastPrice
        self.nowPrice = nowPrice
    }
    
}
