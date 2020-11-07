//
//  HotLineHeader.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/26/20.
//

import UIKit

class HotLineHeader: UICollectionReusableView {
    //
    //MARK: - Variables, constants
    //
    private let messageLabel = UILabel(text: "Հարցերի, բողոքների և առաջարկների համար խնդրում ենք զանգահարել թեժ գծի հեռախոսահամարներով", textColor: .black, textAlignment: .center, font: .systemFont(ofSize: 11), numberOfLines: 0)
    private let defaultPhoneLabel = UILabel(text: "1-28", textColor: .black, textAlignment: .center, font: .systemFont(ofSize: 25))
    //
    //MARK: - Closures
    //
    private lazy var phoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "phone-60"))
        button.addTarget(self, action: #selector(handlePhoneButton), for: .touchUpInside)
        return button
    }()
    //
    //MARK: - Actions
    //
    @objc private func handlePhoneButton() {
        guard let number = URL(string: "tel://" + "1-28") else { return }
        UIApplication.shared.open(number)
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .appGray
        setupStack()
    }
    //
    //MARK: - Functions
    //
    private func setupStack() {
        let stackView = VerticalStackView(arrangedSubviews: [UIView(),messageLabel, phoneButton, defaultPhoneLabel, UIView()], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

