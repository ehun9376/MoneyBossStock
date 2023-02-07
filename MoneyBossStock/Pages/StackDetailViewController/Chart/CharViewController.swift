//
//  CharViewController.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/6.
//

import Foundation
import UIKit
import HSStockChart

class ChartViewController: UIViewController {
    
    var chartType: HSChartType = .timeLineForDay
        
    var isLandscapeMode: Bool = false
    
    var viewModel: ChartViewModel?
    
    
    // MARK: - Life Circle
    
    convenience init(
        type: HSChartType = .timeLineForDay
    ) {
        self.init()
        self.chartType = type
        self.viewModel = .init()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupViewController()
    }
    
    // MARK: - Function
    
    func setupViewController() {
        
        let stockBasicInfo = HSStockBasicInfoModel(json: self.viewModel?.getJsonDataFromFile("SZ300033") ?? [:])
        
        let chartRect: CGRect = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        switch chartType {
            
        case .timeLineForDay:
            
            let timeLineView = HSTimeLine(frame: chartRect)
            let modelArray = self.viewModel?.getTimeLineModelArray(self.viewModel?.getJsonDataFromFile("timeLineForDay") ?? [:], type: self.chartType, basicInfo: stockBasicInfo) ?? []
            timeLineView.dataT = modelArray
            self.view.addSubview(timeLineView)
            
            
        case .timeLineForFiveday:
            
            let stockChartView = HSTimeLine(frame: chartRect, isFiveDay: true)
            let modelArray = self.viewModel?.getTimeLineModelArray(self.viewModel?.getJsonDataFromFile("timeLineForFiveday") ?? [:], type: chartType, basicInfo: stockBasicInfo) ?? []
            stockChartView.dataT = modelArray
            view.addSubview(stockChartView)
            
        case .kLineForDay:
            
            let stockChartView = HSKLineView(frame: chartRect, kLineType: .kLineForDay, theme: HSKLineStyle())
            let allDataK = self.viewModel?.getKLineModelArray(self.viewModel?.getJsonDataFromFile("kLineForDay") ?? [:]) ?? []
            let tmpDataK = Array(allDataK[allDataK.count-70..<allDataK.count])
            stockChartView.configureView(data: tmpDataK)
            view.addSubview(stockChartView)
            
        case .kLineForWeek:
            
            let stockChartView = HSKLineView(frame: chartRect, kLineType: .kLineForWeek, theme: HSKLineStyle())
            let allDataK = self.viewModel?.getKLineModelArray(self.viewModel?.getJsonDataFromFile("kLineForWeek") ?? [:]) ?? []
            let tmpDataK = Array(allDataK[allDataK.count-70..<allDataK.count])
            stockChartView.configureView(data: tmpDataK)
            view.addSubview(stockChartView)
            
        case .kLineForMonth:
            
            let stockChartView = HSKLineView(frame: chartRect, kLineType: .kLineForMonth, theme: HSKLineStyle())
            let allDataK = self.viewModel?.getKLineModelArray(self.viewModel?.getJsonDataFromFile("kLineForMonth") ?? [:]) ?? []
            let tmpDataK = Array(allDataK[allDataK.count-70..<allDataK.count])
            stockChartView.configureView(data: tmpDataK)
            view.addSubview(stockChartView)
            
        case .kLineForMinute:
            
            let stockChartView = HSKLineView(frame: chartRect, kLineType: .kLineForMinute, theme: HSKLineStyle())
            let allDataK = self.viewModel?.getKLineModelArray(self.viewModel?.getJsonDataFromFile("kLineForMonth") ?? [:]) ?? []
            let tmpDataK = Array(allDataK[allDataK.count-70..<allDataK.count])
            stockChartView.configureView(data: tmpDataK)
            view.addSubview(stockChartView)
            
        }
    }

}
