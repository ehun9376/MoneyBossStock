//
//  StackDetailViewController.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation
import UIKit

class TopViewModel {
    
    var lastDayPrice: Float?
    
    var price: Float?
    
    var tradingVolume: Float?
    
    var heightPrice: Float?

    var openPrice: Float?

    var lowPrice: Float?

}

class TopView: UIView {
    
    let priceLabel = UILabel()
    
    let compareLabel = UILabel()
    
    let percentLabel = UILabel()
    
    let tradingVolumeLabel = UILabel()
    
    let heightPriceLabel = UILabel()
    
    let openPriceLabel = UILabel()
    
    let lowPriceLabel = UILabel()
    
    var viewModel: TopViewModel?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(
        viewModel: TopViewModel
    ){
        self.init(frame: .zero)
        self.viewModel = viewModel
        self.defaultSet()
        if let viewModel = self.viewModel {
            self.setupView(model: viewModel)
        }
        self.addView()
    }
    
    func defaultSet() {
        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        self.compareLabel.translatesAutoresizingMaskIntoConstraints = false
        self.compareLabel.font = .systemFont(ofSize: 16)
        
        self.percentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.percentLabel.font = .systemFont(ofSize: 16)
        
        self.tradingVolumeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.tradingVolumeLabel.font = .systemFont(ofSize: 14)
        
        self.heightPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.heightPriceLabel.font = .systemFont(ofSize: 14)
        
        self.openPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.openPriceLabel.font = .systemFont(ofSize: 14)
        
        self.lowPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lowPriceLabel.font = .systemFont(ofSize: 14)
        
    }
    
    func setupView(model: TopViewModel) {
        
        //現價
        self.priceLabel.text = "\(model.price ?? 0)"
        self.priceLabel.textColor = self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.price ?? 0.0)
        
        //價差
        let comparePrice: Float = self.comparePrice(last: model.lastDayPrice ?? 0, now: model.price ?? 0)
        self.compareLabel.text = self.priceToText(price: comparePrice)
        self.compareLabel.textColor = self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.price ?? 0.0)

        
        //價差%
        let percent: Float = self.comparePercent(last: model.lastDayPrice ?? 0, now: model.price ?? 0)
        self.percentLabel.text = "\(self.priceToText(price: percent))%"
        self.percentLabel.textColor = self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.price ?? 0.0)

        
        //交易量
        self.tradingVolumeLabel.text = "量 \(model.tradingVolume ?? 0)"
        
        //高
        self.heightPriceLabel.attributedText = self.attributedStrings(strs: ["高 ","\(model.heightPrice ?? 0)"],
                                                                      colors: [.black, self.compareColor(last: model.lastDayPrice ?? 0.0,
                                                                                                         now: model.heightPrice ?? 0.0)])
        
        //開
        self.openPriceLabel.attributedText = self.attributedStrings(strs: ["開 ","\(model.openPrice ?? 0)"],
                                                                      colors: [.black, self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.openPrice ?? 0.0)])
        
        //低
        self.lowPriceLabel.attributedText = self.attributedStrings(strs: ["低 ","\(model.lowPrice ?? 0)"],
                                                                      colors: [.black, self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.lowPrice ?? 0.0)])

    }
    
    func comparePercent(last: Float, now: Float) -> Float {
        let percent = (last - now / last) * 100
        return percent
        
    }
    
    func comparePrice(last: Float, now: Float) -> Float {
        let price = last - now
        return price
    }
    
    func priceToText(price: Float) -> String {
        if price > 0 {
            return "+\(price)"
        } else if price < 0 {
            return "-\(price)"
        } else {
            return "\(price)"
        }
    }
    
    func compareColor(last: Float, now: Float) -> UIColor {
        if now > last {
            return .red
        } else if now < last {
            return .green
        } else {
            return .black
        }
    }
    
    func addView() {
        let compareAndpercentStackView = UIStackView()
        compareAndpercentStackView.translatesAutoresizingMaskIntoConstraints = false

        compareAndpercentStackView.axis = .horizontal
        compareAndpercentStackView.spacing = 20

        compareAndpercentStackView.addArrangedSubview(self.compareLabel)
        compareAndpercentStackView.addArrangedSubview(self.percentLabel)
//
//
        self.addSubview(self.priceLabel)
        self.addSubview(compareAndpercentStackView)
    //        topView.addSubview(compareLabel)
    //        topView.addSubview(percentLabel)
    //        topView.addSubview(tradingVolumeLabel)
    //        topView.addSubview(heightPriceLabel)
    //        topView.addSubview(openPriceLabel)
    //        topView.addSubview(lowPriceLabel)

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            compareAndpercentStackView.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 5),
            compareAndpercentStackView.leadingAnchor.constraint(equalTo: self.priceLabel.leadingAnchor, constant: 5)
        ])
    }
    
    func attributedStrings(strs: [String], colors: [UIColor]) -> NSAttributedString{
        let attriibute = NSMutableAttributedString(string: strs[0])
        for i in 0...strs.count - 1 {
            let range = (strs[0] as NSString).range(of: strs[i])
            attriibute.addAttributes([NSAttributedString.Key.foregroundColor : colors[i]], range: range)
        }
        return attriibute
    }
    
}

class StackDetailViewController: BaseViewController {
    
    var topView = TopView()
        
    var segmentedControl = UISegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        
//        self.setupSegmentedControl()
//        self.setupTopView(model: .init())
//        
//        self.addAllSubView()
        
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
    
    func setupTopView(model: TopViewModel?) {
        
                
        if let model = model {
            self.topView = .init(viewModel: model)
        }
        
    }
    
    func addAllSubView() {
        
        self.view.addSubview(self.topView)
        
        NSLayoutConstraint.activate([
            self.topView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
}
