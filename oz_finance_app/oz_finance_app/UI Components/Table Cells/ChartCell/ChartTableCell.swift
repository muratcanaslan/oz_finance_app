//
//  ChartTableCell.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

final class ChartTableCell: BaseTableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    //MARK: - Configure
    func configure(with model: ChartTableCellViewModel) {
        self.rankLabel.text = model.rank
        self.valueLabel.text = model.value
    }
}

