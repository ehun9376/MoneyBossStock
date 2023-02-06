//
//  FivePortView.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/3.
//

import Foundation
import UIKit

class FivePortViewModel {
    
    var updateTime: String?
    
    var buy1Price: Int?
    
    var buy1Volumn: Int?
    
    var buy2Price: Int?
    
    var buy2Volumn: Int?
    
    var buy3Price: Int?
    
    var buy3Volumn: Int?
    
    var buy4Price: Int?
    
    var buy4Volumn: Int?
    
    var buy5Price: Int?
    
    var buy5Volumn: Int?
    
    var sell1Price: Int?
    
    var sell1Volumn: Int?
    
    var sell2Price: Int?
    
    var sell2Volumn: Int?
    
    var sell3Price: Int?
    
    var sell3Volumn: Int?
    
    var sell4Price: Int?
    
    var sell4Volumn: Int?
    
    var sell5Price: Int?
    
    var sell5Volumn: Int?
    
    init(updateTime: String? = nil,buy1Price: Int? = nil, buy1Volumn: Int? = nil, buy2Price: Int? = nil, buy2Volumn: Int? = nil, buy3Price: Int? = nil, buy3Volumn: Int? = nil, buy4Price: Int? = nil, buy4Volumn: Int? = nil, buy5Price: Int? = nil, buy5Volumn: Int? = nil, sell1Price: Int? = nil, sell1Volumn: Int? = nil, sell2Price: Int? = nil, sell2Volumn: Int? = nil, sell3Price: Int? = nil, sell3Volumn: Int? = nil, sell4Price: Int? = nil, sell4Volumn: Int? = nil, sell5Price: Int? = nil, sell5Volumn: Int? = nil) {
        self.updateTime = updateTime
        self.buy1Price = buy1Price
        self.buy1Volumn = buy1Volumn
        self.buy2Price = buy2Price
        self.buy2Volumn = buy2Volumn
        self.buy3Price = buy3Price
        self.buy3Volumn = buy3Volumn
        self.buy4Price = buy4Price
        self.buy4Volumn = buy4Volumn
        self.buy5Price = buy5Price
        self.buy5Volumn = buy5Volumn
        self.sell1Price = sell1Price
        self.sell1Volumn = sell1Volumn
        self.sell2Price = sell2Price
        self.sell2Volumn = sell2Volumn
        self.sell3Price = sell3Price
        self.sell3Volumn = sell3Volumn
        self.sell4Price = sell4Price
        self.sell4Volumn = sell4Volumn
        self.sell5Price = sell5Price
        self.sell5Volumn = sell5Volumn
    }
    
    
    
}

class FivePortView: UIView {
    
    var titleLabel = UILabel()
    
    var updateDateLabel = UILabel()
    
    var buy1PriceLabel = UILabel()
    
    var buy1VolumnLabel = UILabel()
    
    var buy2PriceLabel = UILabel()
    
    var buy2VolumnLabel = UILabel()
    
    var buy3PriceLabel = UILabel()
    
    var buy3VolumnLabel = UILabel()
    
    var buy4PriceLabel = UILabel()
    
    var buy4VolumnLabel = UILabel()
    
    var buy5PriceLabel = UILabel()
    
    var buy5VolumnLabel = UILabel()
    
    var sell1PriceLabel = UILabel()
    
    var sell1VolumnLabel = UILabel()
    
    var sell2PriceLabel = UILabel()
    
    var sell2VolumnLabel = UILabel()
    
    var sell3PriceLabel = UILabel()
    
    var sell3VolumnLabel = UILabel()
    
    var sell4PriceLabel = UILabel()
    
    var sell4VolumnLabel = UILabel()
    
    var sell5PriceLabel = UILabel()
    
    var sell5VolumnLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultSet()
        self.addAllSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func defaultSet() {
        
        let font: UIFont = .systemFont(ofSize: 16)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel.text = "買/賣五檔"
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = .white
        
        self.updateDateLabel.textColor = .white
        self.updateDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.buy1PriceLabel.font = font
        self.buy1VolumnLabel.font = font
        self.buy1PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.buy1VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.buy2PriceLabel.font = font
        self.buy2VolumnLabel.font = font
        self.buy2PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.buy2VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.buy3PriceLabel.font = font
        self.buy3VolumnLabel.font = font
        self.buy3PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.buy3VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.buy4PriceLabel.font = font
        self.buy4VolumnLabel.font = font
        self.buy4PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.buy4VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.buy5PriceLabel.font = font
        self.buy5VolumnLabel.font = font
        self.buy5PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.buy5VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.sell1PriceLabel.font = font
        self.sell1VolumnLabel.font = font
        self.sell1PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sell1VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.sell2PriceLabel.font = font
        self.sell2VolumnLabel.font = font
        self.sell2PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sell2VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.sell3PriceLabel.font = font
        self.sell3VolumnLabel.font = font
        self.sell3PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sell3VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.sell4PriceLabel.font = font
        self.sell4VolumnLabel.font = font
        self.sell4PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sell4VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.sell5PriceLabel.font = font
        self.sell5VolumnLabel.font = font
        self.sell5PriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sell5VolumnLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupView(model: FivePortViewModel) {
        
        self.updateDateLabel.text = model.updateTime ?? ""
        
        self.buy1PriceLabel.text = "\(model.buy1Price ?? 0)"
        self.buy1VolumnLabel.text = "\(model.buy1Volumn ?? 0)"
        
        self.buy2PriceLabel.text = "\(model.buy2Price ?? 0)"
        self.buy2VolumnLabel.text = "\(model.buy2Volumn ?? 0)"
        
        self.buy3PriceLabel.text = "\(model.buy3Price ?? 0)"
        self.buy3VolumnLabel.text = "\(model.buy3Volumn ?? 0)"
        
        self.buy4PriceLabel.text = "\(model.buy4Price ?? 0)"
        self.buy4VolumnLabel.text = "\(model.buy4Volumn ?? 0)"
        
        self.buy5PriceLabel.text = "\(model.buy5Price ?? 0)"
        self.buy5VolumnLabel.text = "\(model.buy5Volumn ?? 0)"
        
        self.sell1PriceLabel.text = "\(model.sell1Price ?? 0)"
        self.sell1VolumnLabel.text = "\(model.sell1Volumn ?? 0)"
        
        self.sell2PriceLabel.text = "\(model.sell2Price ?? 0)"
        self.sell2VolumnLabel.text = "\(model.sell2Volumn ?? 0)"
        
        self.sell3PriceLabel.text = "\(model.sell3Price ?? 0)"
        self.sell3VolumnLabel.text = "\(model.sell3Volumn ?? 0)"
        
        self.sell4PriceLabel.text = "\(model.sell4Price ?? 0)"
        self.sell4VolumnLabel.text = "\(model.sell4Volumn ?? 0)"
        
        self.sell5PriceLabel.text = "\(model.sell5Price ?? 0)"
        self.sell5VolumnLabel.text = "\(model.sell5Volumn ?? 0)"
        
        
    }
    
    func createBarLabel() -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "|"
        label.textColor = .gray
        
        return label
    }
    
    func createBarView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }
    
    func createThreeLabelView(titleLabel: UILabel, priceLabel: UILabel, volumnLabel: UILabel) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        titleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(priceLabel)
        priceLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(volumnLabel)
        volumnLabel.adjustsFontSizeToFitWidth = true
        
        let width = ((UIScreen.main.bounds.width/2) - 2 - 40 - 5 - 10 - 10 - 10)/2
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            titleLabel.widthAnchor.constraint(equalToConstant: 40),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            priceLabel.widthAnchor.constraint(equalToConstant: width),
            
            volumnLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            volumnLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            volumnLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 10),
            volumnLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            volumnLabel.widthAnchor.constraint(equalToConstant: width)
            
        ])
        
        return view
    }
    
    func createHoriStackView(left: UIView, bar: UIView, right: UIView) -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fill
        
        
        stackView.addArrangedSubview(left)
        stackView.addArrangedSubview(bar)
        stackView.addArrangedSubview(right)
        
        NSLayoutConstraint.activate([
            left.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 2),
            bar.widthAnchor.constraint(equalToConstant: 2),
            right.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 2),
        ])
        
        return stackView
        
    }
    
    func creatTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        
        return label
    }
    
    func addAllSubView() {
        
        let barView = self.createBarView()
        barView.addSubview(self.titleLabel)
        barView.addSubview(self.updateDateLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: barView.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: barView.leadingAnchor, constant: 5),
            self.titleLabel.bottomAnchor.constraint(equalTo: barView.bottomAnchor),
            
            self.updateDateLabel.topAnchor.constraint(equalTo: barView.topAnchor),
            self.updateDateLabel.trailingAnchor.constraint(equalTo: barView.trailingAnchor, constant: -5),
            self.updateDateLabel.bottomAnchor.constraint(equalTo: barView.bottomAnchor)
        ])
        
        self.addSubview(barView)
        
        
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: self.topAnchor),
            barView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        let bigStackView = UIStackView()
        bigStackView.translatesAutoresizingMaskIntoConstraints = false
        bigStackView.axis = .vertical
        bigStackView.spacing = 10
        bigStackView.distribution = .fillEqually
        
        self.addSubview(bigStackView)
        
        NSLayoutConstraint.activate([
            bigStackView.topAnchor.constraint(equalTo: barView.bottomAnchor),
            bigStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bigStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bigStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        let stack1 = self.createHoriStackView(left: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "買1"),
                                                                                  priceLabel: self.buy1PriceLabel,
                                                                                  volumnLabel: self.buy1VolumnLabel),
                                                  bar: self.createBarLabel(),
                                                  right: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "賣1"),
                                                                                   priceLabel: self.sell1PriceLabel,
                                                                                   volumnLabel: self.sell1VolumnLabel))
        
        let stack2 = self.createHoriStackView(left: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "買2"),
                                                                                  priceLabel: self.buy2PriceLabel,
                                                                                  volumnLabel: self.buy2VolumnLabel),
                                                  bar: self.createBarLabel(),
                                                  right: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "賣2"),
                                                                                   priceLabel: self.sell2PriceLabel,
                                                                                   volumnLabel: self.sell2VolumnLabel))
        
        let stack3 = self.createHoriStackView(left: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "買3"),
                                                                                  priceLabel: self.buy3PriceLabel,
                                                                                  volumnLabel: self.buy3VolumnLabel),
                                                  bar: self.createBarLabel(),
                                                  right: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "賣3"),
                                                                                   priceLabel: self.sell3PriceLabel,
                                                                                   volumnLabel: self.sell3VolumnLabel))
        
        let stack4 = self.createHoriStackView(left: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "買4"),
                                                                                  priceLabel: self.buy4PriceLabel,
                                                                                  volumnLabel: self.buy4VolumnLabel),
                                                  bar: self.createBarLabel(),
                                                  right: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "賣4"),
                                                                                   priceLabel: self.sell4PriceLabel,
                                                                                   volumnLabel: self.sell4VolumnLabel))
        
        let stack5 = self.createHoriStackView(left: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "買5"),
                                                                                  priceLabel: self.buy5PriceLabel,
                                                                                  volumnLabel: self.buy5VolumnLabel),
                                                  bar: self.createBarLabel(),
                                                  right: self.createThreeLabelView(titleLabel: self.creatTitleLabel(title: "賣5"),
                                                                                   priceLabel: self.sell5PriceLabel,
                                                                                   volumnLabel: self.sell5VolumnLabel))
        
      
        
        bigStackView.addArrangedSubview(stack1)
        bigStackView.addArrangedSubview(stack2)
        bigStackView.addArrangedSubview(stack3)
        bigStackView.addArrangedSubview(stack4)
        bigStackView.addArrangedSubview(stack5)

        
        
        
    }
    
}
