//
//  StackDetailViewController.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit
import HSStockChart



class StackDetailViewController: BaseViewController {
    
    var topView = TopView()
    
    var fiveView = FivePortView()
        
    var segmentedControl = UISegmentedControl()
    
    var currentShowingChartVC: UIViewController?
    
    var controllerArray : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupSegmentedControl()
        
        self.setupTopView(model: .init(lastDayPrice: 10000, price: 11000, tradingVolume: 20, heightPrice: 11555, openPrice: 9999, lowPrice: 8888))
        
        self.setupFivePortView(model: .init(updateTime: "2023", buy1Price: 1000, buy1Volumn: 100000, buy2Price: 41863, buy2Volumn: 1000, buy3Price: 1000000, buy3Volumn: 10, buy4Price: 1, buy4Volumn: 1, buy5Price: 10000, buy5Volumn: 1529, sell1Price: 98900, sell1Volumn: 456489435, sell2Price: 148945, sell2Volumn: 0840, sell3Price: 849456, sell3Volumn: 48453, sell4Price: 84964065, sell4Volumn: 489484, sell5Price: 3468046, sell5Volumn: 846))
        
        self.addAllSubView()
        self.addChartController()
        self.changeController(index: 0)
        
    }
    
    
    func setupSegmentedControl() {
        
        self.segmentedControl = UISegmentedControl(items: [
            "當盤",
            "當日",
            "日K",
            "週K",
            "月K"
        ])
        
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        self.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        
        self.changeController(index: sender.selectedSegmentIndex)

    }
    
    func changeController(index: Int) {
        
        currentShowingChartVC?.willMove(toParent: nil)
        currentShowingChartVC?.view.removeFromSuperview()
        currentShowingChartVC?.removeFromParent()
        
        if let selectedVC = self.controllerArray[index] as? ChartViewController {
            selectedVC.chartRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
            selectedVC.view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(selectedVC.view)
            
            NSLayoutConstraint.activate([
                selectedVC.view.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
                selectedVC.view.bottomAnchor.constraint(equalTo: self.fiveView.topAnchor),
                selectedVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                selectedVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
            
            self.addChild(selectedVC)
            if (selectedVC.view.superview == nil){
                self.view.addSubview(selectedVC.view)
            }
            selectedVC.didMove(toParent: self)
            
            currentShowingChartVC = selectedVC
        }

    }
    
    func setupTopView(model: TopViewModel?) {
                
        if let model = model {
            self.topView.setupView(model: model)
        }
        
    }
    
    func setupFivePortView(model: FivePortViewModel?) {
        if let model = model {
            self.fiveView.setupView(model: model)
        }
    }
    
    func addAllSubView() {
        
        self.view.addSubview(self.topView)
        self.view.addSubview(self.fiveView)
        self.view.addSubview(self.segmentedControl)
        
        NSLayoutConstraint.activate([
            self.topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.topView.heightAnchor.constraint(equalToConstant: 100),
            
            self.segmentedControl.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 5),
            self.segmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.segmentedControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            self.fiveView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.fiveView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.fiveView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.fiveView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
    }
    
    func addChartController() {
        
        // 分时线
        let timeViewcontroller = ChartViewController(type: .timeLineForDay)
        controllerArray.append(timeViewcontroller)
        
        // 五日分时线
        let fiveDayTimeViewController = ChartViewController(type: .timeLineForFiveday)
        controllerArray.append(fiveDayTimeViewController)
        
        // 日 K 线
        let kLineViewController = ChartViewController(type: .kLineForDay)
        controllerArray.append(kLineViewController)
        
        // 周 K 线
        let weeklyKLineViewController = ChartViewController(type: .kLineForWeek)
        controllerArray.append(weeklyKLineViewController)
        
        // 月 K 线
        let monthlyKLineViewController = ChartViewController(type: .kLineForMonth)
        controllerArray.append(monthlyKLineViewController)
    }
    
}
