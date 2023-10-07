//
//  NavigationItem+Ext.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

extension UINavigationItem {
    
    func setTitle(_ title: String, subtitle: String) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .darkText
        titleLabel.font = .boldSystemFont(ofSize: 14)
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 16, weight: .light)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.layoutSubviews()
        
        self.titleView = stackView
    }
}
