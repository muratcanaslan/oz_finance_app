//
//  CryptoTableCell.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 6.10.2023.
//

import UIKit

final class CryptoTableCell: BaseTableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var cryptoIcon: UIImageView!
    @IBOutlet private weak var crpytoShortNameLabel: UILabel!
    @IBOutlet private weak var cryptoValueLabel: UILabel!
    @IBOutlet private weak var cryptoLongNameLabel: UILabel!
    @IBOutlet private weak var crpytoPercentageLabel: UILabel!
    
    //MARK: - Configure
    func configure(with model: CryptoTableCellViewModel) {
        if let url = model.icon {
            cryptoIcon.downloadedFrom(url: url)
        }

        crpytoPercentageLabel.textColor = model.percentageTextColor
        crpytoShortNameLabel.text = model.shortName
        cryptoLongNameLabel.text = model.longName
        cryptoValueLabel.text = model.formattedValue(with: model.value)
        crpytoPercentageLabel.text = model.formattedChangeValue
    }
}


