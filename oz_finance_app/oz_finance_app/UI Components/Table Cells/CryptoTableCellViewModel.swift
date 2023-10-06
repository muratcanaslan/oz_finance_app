//
//  CryptoTableCellViewModel.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import Foundation

struct CryptoTableCellViewModel {
    var icon: URL?
    var shortName: String
    var longName: String
    private var value: String
    var percentage: String
    var isLow: Bool?
    var changeValue: String
    
    init(model: Coin) {
        self.icon = model.iconUrl
        self.shortName = model.symbol ?? "-"
        self.longName = model.name ?? "-"
        self.isLow = model.lowVolume
        self.changeValue = model.change ?? "-"
        self.percentage = ""
        self.value = model.price ?? "-"
    }
    
    func formattedValue() -> String {
        guard let doubleValue = Double(value) else { return "-"}
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3

        if let formattedValue = formatter.string(from: NSNumber(value: doubleValue)) {
            return "$\(formattedValue)"
        } else {
            return "-"
        }
    }
}
