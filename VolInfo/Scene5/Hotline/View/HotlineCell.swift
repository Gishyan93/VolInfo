//
//  HotLineCell.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class HotLineCell : BaseCell {
    //
    //MARK: - Properties
    //
    var hotline: HotLine? {
        didSet {
            guard let hotline = hotline else {return}
            
            purposeLabel.text = hotline.purpose
            
            if let contactNumber = hotline.contactnumber {
                phoneLabel.text = "Կոնտակտ՝ \(contactNumber)"
            }
        }
    }
    
    private let purposeLabel = UILabel(text: "", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14), numberOfLines: 0)
    private let phoneLabel = UILabel(text: "հեռախոսահամար՝ ", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14))
    private let separatorView = UIView.createSeparatorView(withColor: .black)
    //
    //MARK: - Adding subviews
    //
    override func setupViews()  {
        super.setupViews()
        
        setupSeparatorView()
        setupStackView()
        
    }
    
    private func setupSeparatorView() {
        separatorView.setHeight(1)
    }
    private func setupStackView() {
        let stackView = VerticalStackView(arrangedSubviews: [purposeLabel,phoneLabel,separatorView], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 8, left: 16, bottom: 8, right: 16))
    }
}


