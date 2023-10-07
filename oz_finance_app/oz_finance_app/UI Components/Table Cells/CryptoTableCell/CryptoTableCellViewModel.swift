//
//  CryptoTableCellViewModel.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import UIKit

struct CryptoTableCellViewModel {
    //MARK: - Init
    init(model: Coin) {
        self.icon = model.iconUrl
        self.shortName = model.symbol ?? "-"
        self.longName = model.name ?? "-"
        self.changeValue = model.change
        self.value = model.price ?? "-"
        self.sparklines = model.sparkline
        
        self.sortable24HVolume = Double(model.volume24h ?? "0") ?? 0.0
        self.sortableMarketCap = Double(model.marketCap ?? "0") ?? 0.0
        self.sortableListedAt = model.listedAt ?? 0.0
        self.sortablePrice = Double(model.price ?? "0") ?? 0.0
        self.sortableChange = Double(model.change ?? "0") ?? 0.0
        self.btcPrice = model.btcPrice
        self.url = model.coinrankingUrl
    }
    
    //MARK: - Filtered Related Properties
    var sortable24HVolume: Double
    var sortableMarketCap: Double
    var sortableListedAt: Double
    var sortablePrice: Double
    var sortableChange: Double
    
    //MARK: - Properties
    var value: String
    var icon: URL?
    var shortName: String
    var longName: String
    var changeValue: String?
    var sparklines: [String]?
    var btcPrice: String?
    var url: URL?
    
    var formattedSparklines: [String] {
        guard let sparklines else { return [] }
        let arr: [String] = sparklines.compactMap({ formattedValue(with: $0 )})
        return arr
    }
    
    var doubleValue: Double? {
        return Double(value)
    }
    
    var highValue: String {
        let doubleSparks: [Double] = (sparklines?.compactMap({ Double($0) }))!
        return formattedValue(with: doubleSparks.max())
    }
    
    var lowValue: String {
        let doubleSparks: [Double] = (sparklines?.compactMap({ Double($0) }))!
        return formattedValue(with: doubleSparks.min())
    }
    var isLow: Bool? {
        if let changeValue {
            if let doubleValue = Double(changeValue) {
                return doubleValue.sign == .minus ? true : false
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    var formattedChangeValue: String {
        if let changeValue {
             return "\(changeValue)% (\(formattedValue(with: extractLastTwoValue())))"
        } else {
            return "-"
        }
    }
    
    var percentageTextColor: UIColor {
        if let isLow {
            return isLow ? .red : .green
        } else {
            return .darkGray
        }
    }
    
    //MARK: - Helper Methods
    func extractLastTwoValue() -> Double? {
        if let sparklines, sparklines.count > 2 {
            if let v1 = Double(sparklines[sparklines.count - 1]), let v2 = Double(sparklines[sparklines.count - 2]) {
                let diff = v1 - v2
                return diff
            } else {
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    func formattedValue(with value: String?) -> String {
        guard let doubleValue = Double(value ?? "-") else { return "-"}
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
    
    func formattedValue(with value: Double?) -> String {
        guard let value = value else { return "-"}
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 4
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3

        if let formattedValue = formatter.string(from: NSNumber(value: value)) {
            return "$\(formattedValue)"
        } else {
            return "-"
        }
    }
    
    func createChartViewModels() -> [ChartTableCellViewModel] {
        var cellVMs = [ChartTableCellViewModel]()
        for (index, value) in formattedSparklines.reversed().enumerated() {
            cellVMs.append(.init(rank: "\(index + 1).", value: value))
        }
        return cellVMs
    }
}
