//
//  StackDetailViewModel.swift
//  MoneyBossStock
//
//  Created by 陳逸煌 on 2023/2/7.
//

import Foundation

protocol StockDetailMothod {
    func changeController(index: Int)
}

class StockDetailViewModel {

    init(
        stockID: String?,
        delegate: StockDetailMothod
    ) {
        self.stockID = stockID
        self.delegate = delegate
    }
    
    
    var delegate: StockDetailMothod?
    
    var stockID: String? = "" {
        didSet {
            self.getStockAPI()
        }
    }
    
    let segmentItems: [String] = ["當盤", "當日", "日K", "週K", "月K"]
    
    func getStockAPI() {
        
    }
    
    func creatTopViewModel() -> TopViewModel {
        return .init(lastDayPrice: 10000, price: 11000, tradingVolume: 20, heightPrice: 11555, openPrice: 9999, lowPrice: 8888)
    }
    
    func creatFivePortViewModel() -> FivePortViewModel {
        return  .init(updateTime: "2023", buy1Price: 1000, buy1Volumn: 100000, buy2Price: 41863, buy2Volumn: 1000, buy3Price: 1000000, buy3Volumn: 10, buy4Price: 1, buy4Volumn: 1, buy5Price: 10000, buy5Volumn: 1529, sell1Price: 98900, sell1Volumn: 456489435, sell2Price: 148945, sell2Volumn: 0840, sell3Price: 849456, sell3Volumn: 48453, sell4Price: 84964065, sell4Volumn: 489484, sell5Price: 3468046, sell5Volumn: 846)
    }
    
}
