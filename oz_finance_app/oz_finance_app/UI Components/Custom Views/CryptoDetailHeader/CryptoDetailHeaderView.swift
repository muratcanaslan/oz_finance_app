//
//  CryptoDetailHeaderView.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

final class CryptoDetailHeaderView: BaseView {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var cryptoValueLabel: UILabel!
    @IBOutlet private weak var highValueLabel: UILabel!
    @IBOutlet private weak var lowValueLabel: UILabel!
    @IBOutlet private weak var percentageLabel: UILabel!
    
    //MARK: - Configure
    func configure(with model: CryptoTableCellViewModel) {
        cryptoValueLabel.text = model.formattedValue(with: model.value)
        percentageLabel.text = model.formattedChangeValue
        percentageLabel.textColor = model.percentageTextColor
        
        setAttrText(label: highValueLabel, text: "High: \(model.highValue)", highlightedText: model.highValue, highlightedColor: .green)
        setAttrText(label: lowValueLabel, text: "Low: \(model.lowValue)", highlightedText: model.lowValue, highlightedColor: .red)
    }
    
    //MARK: - UI Helpers
    func setAttrText(label: UILabel, text: String, highlightedText: String, highlightedColor: UIColor){
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setColor(color: highlightedColor, forText: highlightedText)
        label.attributedText = attrStr
    }
}
