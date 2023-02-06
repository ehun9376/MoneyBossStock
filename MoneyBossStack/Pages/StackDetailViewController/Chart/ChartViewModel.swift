//
//  ChartViewModel.swift
//  MoneyBossStock
//
//  Created by 陳逸煌 on 2023/2/6.
//

import Foundation
import HSStockChart

class ChartViewModel {
    
    func getJsonDataFromFile(_ fileName: String) -> JBJson {
        let pathForResource = Bundle.main.path(forResource: fileName, ofType: "json")
        let content = try! String(contentsOfFile: pathForResource!, encoding: String.Encoding.utf8)
        let jsonContent = content.data(using: String.Encoding.utf8)!
        
        do {
            return try JBJson(data: jsonContent)
            
        } catch {
            return JBJson()
        }
    }
    
    func getTimeLineModelArray(_ json: JBJson) -> [HSTimeLineModel] {
        var modelArray = [HSTimeLineModel]()
        for jsonData in json["chartlist"].arrayValue {
            let model = HSTimeLineModel()
            model.time = Date.hschart.toDate(jsonData["time"].stringValue, format: "EEE MMM d HH:mm:ss z yyyy").hschart.toString("HH:mm")
            model.avgPirce = CGFloat(jsonData["avg_price"].doubleValue)
            model.price = CGFloat(jsonData["current"].doubleValue)
            model.volume = CGFloat(jsonData["volume"].doubleValue)
            model.days = (json["days"].arrayObject as? [String]) ?? [""]
            modelArray.append(model)
        }
        return modelArray
    }

    func getTimeLineModelArray(_ json: JBJson, type: HSChartType, basicInfo: HSStockBasicInfoModel) -> [HSTimeLineModel] {
        var modelArray = [HSTimeLineModel]()
        var toComparePrice: CGFloat = 0

        if type == .timeLineForFiveday {
            toComparePrice = CGFloat(json["chartlist"][0]["current"].doubleValue)

        } else {
            toComparePrice = basicInfo.preClosePrice
        }

        for jsonData in json["chartlist"].arrayValue {
            let model = HSTimeLineModel()
            model.time = Date.hschart.toDate(jsonData["time"].stringValue, format: "EEE MMM d HH:mm:ss z yyyy").hschart.toString("HH:mm")
            model.avgPirce = CGFloat(jsonData["avg_price"].doubleValue)
            model.price = CGFloat(jsonData["current"].doubleValue)
            model.volume = CGFloat(jsonData["volume"].doubleValue)
            model.rate = (model.price - toComparePrice) / toComparePrice
            model.preClosePx = basicInfo.preClosePrice
            model.days = (json["days"].arrayObject as? [String]) ?? [""]
            modelArray.append(model)
        }

        return modelArray
    }
    
    func getKLineModelArray(_ json: JBJson) -> [HSKLineModel] {
        var models = [HSKLineModel]()
        for jsonData in json["chartlist"].arrayValue {
            let model = HSKLineModel()
            model.date = Date.hschart.toDate(jsonData["time"].stringValue, format: "EEE MMM d HH:mm:ss z yyyy").hschart.toString("yyyyMMddHHmmss")
            model.open = CGFloat(jsonData["open"].doubleValue)
            model.close = CGFloat(jsonData["close"].doubleValue)
            model.high = CGFloat(jsonData["high"].doubleValue)
            model.low = CGFloat(jsonData["low"].doubleValue)
            model.volume = CGFloat(jsonData["volume"].doubleValue)
            model.ma5 = CGFloat(jsonData["ma5"].doubleValue)
            model.ma10 = CGFloat(jsonData["ma10"].doubleValue)
            model.ma20 = CGFloat(jsonData["ma20"].doubleValue)
            model.ma30 = CGFloat(jsonData["ma30"].doubleValue)
            model.diff = CGFloat(jsonData["dif"].doubleValue)
            model.dea = CGFloat(jsonData["dea"].doubleValue)
            model.macd = CGFloat(jsonData["macd"].doubleValue)
            model.rate = CGFloat(jsonData["percent"].doubleValue)
            models.append(model)
        }
        return models
    }
}
