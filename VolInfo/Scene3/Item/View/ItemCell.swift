//
//  ItemCell.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class ItemCell : BaseCell {
    //
    //MARK: - Properties
    //
    var item: Item? {
        didSet {
            guard let item = item else {return}
            
            dateLabel.text = item.addeddate
            itemNameLabel.text = item.itemname
            if let count = item.itemcount {
                itemNeededCountLabel.text = "Անհրաժեշտ քանակը՝ \(count)"
            }
        }
    }
    private let dateLabel = UILabel(text: "05-06-2020", textColor: .appLightGray, textAlignment: .left, font: .systemFont(ofSize: 12))
    private let itemNameLabel = UILabel(text: "Ատամի խոզանակ", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14))
    private let itemNeededCountLabel = UILabel(text: "Անհրաժեշտ քանակը՝ 1000", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14))
    private let separatorView = UIView.createSeparatorView(withColor: .black)
    //
    //MARK: - Closures
    //
    
    //
    //MARK: - Adding subviews
    //
    override func setupViews()  {
        super.setupViews()
        
        //backgroundColor = .soldierGray
        //layer.cornerRadius = 7
        
        setupSeparatorView()
        setupStackView()
        
    }
    
    private func setupSeparatorView() {
        separatorView.setHeight(1)
    }
    private func setupStackView() {
        let stackView = VerticalStackView(arrangedSubviews: [dateLabel, itemNameLabel, itemNeededCountLabel,separatorView], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
  
}



