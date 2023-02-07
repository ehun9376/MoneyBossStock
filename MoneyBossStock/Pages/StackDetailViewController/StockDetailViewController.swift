//
//  StackDetailViewController.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit
import HSStockChart



class StockDetailViewController: BaseViewController {
    
    var topView = TopView()
    
    var fiveView = FivePortView()
        
    var segmentedControl = UISegmentedControl()
    
    var currentShowingChartVC: UIViewController?
    
    var controllerArray : [UIViewController] = []
    
    var viewModel: StockDetailViewModel?
    
    var stockID: String?
    
    convenience init(
        stockID: String?
    ){
        self.init()
        self.stockID = stockID
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = stockID
        
        self.viewModel = .init(stockID: stockID ?? "", delegate: self)
        
        self.view.backgroundColor = .white
        
        self.setupSegmentedControl()
        
        self.setupTopView(model: self.viewModel?.creatTopViewModel())
        
        self.setupFivePortView(model: self.viewModel?.creatFivePortViewModel())
        
        self.addAllSubView()
        self.addChartController()
        self.changeController(index: 0)
        
    }
    
    
    func setupSegmentedControl() {
        
        self.segmentedControl = UISegmentedControl(items: self.viewModel?.segmentItems)
        
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        self.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        self.changeController(index: sender.selectedSegmentIndex)
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

extension StockDetailViewController: StockDetailMothod {
    func changeController(index: Int) {
        
        self.currentShowingChartVC?.willMove(toParent: nil)
        self.currentShowingChartVC?.view.removeFromSuperview()
        self.currentShowingChartVC?.removeFromParent()
        
        if let selectedVC = self.controllerArray[index] as? ChartViewController {
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
            
            self.currentShowingChartVC = selectedVC
        }

    }
}
