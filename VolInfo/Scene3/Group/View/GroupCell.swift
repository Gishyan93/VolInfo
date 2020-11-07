//
//  HomeCell.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class GroupCell : BaseCell {
    //
    //MARK: - Properties
    //
    var group: Group? {
        didSet {
            guard let group = group else {return}
            
            groupNameLabel.text = group.groupname
            
            if let count = group.groupcount {
                groupCountLabel.text = "\(count) ապրանքատեսակ"
            }
            
        }
    }
    private let groupNameLabel = UILabel(text: "", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14))
    private let groupCountLabel = UILabel(text: "", textColor: .black, textAlignment: .left, font: .systemFont(ofSize: 14))
    //
    //MARK: - Closures
    //
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setFrame(.init(width: 60, height: 60))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 7
        imageView.image = #imageLiteral(resourceName: "no-image-50")
        return imageView
    }()
    //
    //MARK: - Adding subviews
    //
    override func setupViews()  {
        super.setupViews()
        
        backgroundColor = .appGray
        layer.cornerRadius = 7
        
        setupStackView()
    }
    
    private func setupStackView() {
        let dummyImageVerticalStackView = VerticalStackView(arrangedSubviews: [UIView(), imageView,UIView()])
        let dummyLabelsVerticalStackView = VerticalStackView(arrangedSubviews: [groupNameLabel, groupCountLabel, UIView()], spacing: 16)
        let stackView = HorizontalStackView(arrangedSubviews: [dummyImageVerticalStackView, dummyLabelsVerticalStackView], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
  
}

