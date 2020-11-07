//
//  AdmissionCell.swift
//  Soldier
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class AdmissionCell : BaseCell {
    //
    //MARK: - Properties
    //
    var admission: Admission? {
        didSet {
            guard let admission = admission else {return}
            
            addressLabel.text = admission.address
            if let number = admission.contactnumber {
                phoneLabel.text = "Կոնտակտներ՝ \(number)"
            }
        }
    }
    
    private let addressLabel = UILabel(text: "Ք.Երևան, արշակունյաց 40", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14), numberOfLines: 0)
    private let phoneLabel = UILabel(text: "Կոնտակտներ՝ +37494999999", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14))
    private let separatorView = UIView.createSeparatorView(withColor: .black)
    //
    //MARK: - Closures
    //
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.image = #imageLiteral(resourceName: "marker-24")
        imageView.setFrame(.init(width: 30, height: 30))
        return imageView
    }()
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
        let dummyHorizontalStack = HorizontalStackView(arrangedSubviews: [phoneLabel, imageView])
        let stackView = VerticalStackView(arrangedSubviews: [addressLabel,dummyHorizontalStack,separatorView], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
  
}


