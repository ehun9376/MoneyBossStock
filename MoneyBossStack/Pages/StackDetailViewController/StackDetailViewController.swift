//
//  StackDetailViewController.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit
//class TopViewModel {
//    let priceLabel = UILabel()
//    priceLabel.text = "15415"
//    
//    let compareLabel = UILabel()
//    compareLabel.text = "+33"
//    
//    let percentLabel = UILabel()
//    percentLabel.text = "+0.215%"
//    
//    let tradingVolumeLabel = UILabel()
//    tradingVolumeLabel.text = "量 9245"
//    
//    let heightPriceLabel = UILabel()
//    heightPriceLabel.text = "高 15418"
//    
//    let openPriceLabel = UILabel()
//    openPriceLabel.text = "開 15387"
//    
//    let lowPriceLabel = UILabel()
//    lowPriceLabel.text = "低 15384"
//    
//}

class StackDetailViewController: BaseViewController {
        
    var segmentedControl = UISegmentedControl()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSegmentedControl()
        self.addSubView()
    }
    
    func setupSegmentedControl() {
        
        self.segmentedControl = UISegmentedControl(items: [
            "當盤",
            "當日",
            "日K",
            "週K",
            "月K"
        ])
        
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        self.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    func setupTopView() {
        let topView = UIView()
        view.backgroundColor = .white

        let priceLabel = UILabel()
        priceLabel.text = "15415"
        
        let compareLabel = UILabel()
        compareLabel.text = "+33"
        
        let percentLabel = UILabel()
        percentLabel.text = "+0.215%"
        
        let tradingVolumeLabel = UILabel()
        tradingVolumeLabel.text = "量 9245"
        
        let heightPriceLabel = UILabel()
        heightPriceLabel.text = "高 15418"
        
        let openPriceLabel = UILabel()
        openPriceLabel.text = "開 15387"
        
        let lowPriceLabel = UILabel()
        lowPriceLabel.text = "低 15384"
        
        let compareAndpercentStackView = UIStackView()
        compareAndpercentStackView.axis = .horizontal
        compareAndpercentStackView.spacing = 20
        
        compareAndpercentStackView.addArrangedSubview(compareLabel)
        compareAndpercentStackView.addArrangedSubview(percentLabel)
        
        
        topView.addSubview(priceLabel)
        topView.addSubview(compareAndpercentStackView)
//        topView.addSubview(compareLabel)
//        topView.addSubview(percentLabel)
//        topView.addSubview(tradingVolumeLabel)
//        topView.addSubview(heightPriceLabel)
//        topView.addSubview(openPriceLabel)
//        topView.addSubview(lowPriceLabel)
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 30)
        ])
    }
    
    func addSubView() {
        
    }
    
}
