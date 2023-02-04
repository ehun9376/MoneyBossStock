//
//  TopView.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/3.
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
    
    init(
        lastDayPrice: Float? = nil,
        price: Float? = nil,
        tradingVolume: Float? = nil,
        heightPrice: Float? = nil,
        openPrice: Float? = nil,
        lowPrice: Float? = nil
    ) {
        self.lastDayPrice = lastDayPrice
        self.price = price
        self.tradingVolume = tradingVolume
        self.heightPrice = heightPrice
        self.openPrice = openPrice
        self.lowPrice = lowPrice
    }

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
        self.defaultSet()
        self.addView()
    }
    
    convenience init(
        viewModel: TopViewModel
    ){
        self.init(frame: .zero)
        self.viewModel = viewModel
       
        if let viewModel = self.viewModel {
            self.setupView(model: viewModel)
        }
       
    }
    
    func defaultSet() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        self.priceLabel.adjustsFontSizeToFitWidth = true
        
        self.compareLabel.translatesAutoresizingMaskIntoConstraints = false
        self.compareLabel.font = .systemFont(ofSize: 16)
        self.compareLabel.adjustsFontSizeToFitWidth = true
        
        self.percentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.percentLabel.font = .systemFont(ofSize: 16)
        self.percentLabel.adjustsFontSizeToFitWidth = true
        
        self.tradingVolumeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.tradingVolumeLabel.font = .systemFont(ofSize: 14)
        self.tradingVolumeLabel.adjustsFontSizeToFitWidth = true
        
        self.heightPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.heightPriceLabel.font = .systemFont(ofSize: 14)
        self.heightPriceLabel.adjustsFontSizeToFitWidth = true
        
        self.openPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.openPriceLabel.font = .systemFont(ofSize: 14)
        self.openPriceLabel.adjustsFontSizeToFitWidth = true
        
        self.lowPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lowPriceLabel.font = .systemFont(ofSize: 14)
        self.lowPriceLabel.adjustsFontSizeToFitWidth = true
        
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
        self.heightPriceLabel.attributedText = self.attributedStrings(strs: ["高 \(model.heightPrice ?? 0)","\(model.heightPrice ?? 0)"],
                                                                      colors: [.black, self.compareColor(last: model.lastDayPrice ?? 0.0,
                                                                                                         now: model.heightPrice ?? 0.0)])
        
        //開
        self.openPriceLabel.attributedText = self.attributedStrings(strs: ["開 \(model.openPrice ?? 0)","\(model.openPrice ?? 0)"],
                                                                      colors: [.black, self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.openPrice ?? 0.0)])
        
        //低
        self.lowPriceLabel.attributedText = self.attributedStrings(strs: ["低 \(model.lowPrice ?? 0)","\(model.lowPrice ?? 0)"],
                                                                      colors: [.black, self.compareColor(last: model.lastDayPrice ?? 0.0, now: model.lowPrice ?? 0.0)])

    }
    
    func comparePercent(last: Float, now: Float) -> Float {
        let percent = ((now - last) / last) * 100
        return percent
        
    }
    
    func comparePrice(last: Float, now: Float) -> Float {
        let price = now - last
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
    
    func creatHoriStackView(left: UILabel, right: UILabel) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(left)
        stackView.addArrangedSubview(right)
        
        return stackView
    }
    
    func creatVerticalStackView(top: UIStackView, bottom: UIStackView) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(top)
        stackView.addArrangedSubview(bottom)
        
        return stackView
    }
    
    func addView() {
        let compareAndpercentStackView = UIStackView()
        compareAndpercentStackView.translatesAutoresizingMaskIntoConstraints = false

        compareAndpercentStackView.axis = .horizontal
        compareAndpercentStackView.spacing = 5

        compareAndpercentStackView.addArrangedSubview(self.compareLabel)
        compareAndpercentStackView.addArrangedSubview(self.percentLabel)
        
        let leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.addSubview(self.priceLabel)
        leftView.addSubview(compareAndpercentStackView)

        NSLayoutConstraint.activate([
            leftView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7 * 3),
            
            priceLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 30),
            
            compareAndpercentStackView.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 5),
            compareAndpercentStackView.leadingAnchor.constraint(equalTo: self.priceLabel.leadingAnchor),
            compareAndpercentStackView.trailingAnchor.constraint(equalTo: leftView.trailingAnchor)
        ])
        
        self.addSubview(leftView)
        
        NSLayoutConstraint.activate([
            leftView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftView.topAnchor.constraint(equalTo: self.topAnchor),
            leftView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        let topStackView = self.creatHoriStackView(left: self.tradingVolumeLabel, right: self.heightPriceLabel)
        
        let bottomStackView = self.creatHoriStackView(left: self.openPriceLabel, right: self.lowPriceLabel)
        
        let verticalStackView = self.creatVerticalStackView(top: topStackView, bottom: bottomStackView)
        
        self.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
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
