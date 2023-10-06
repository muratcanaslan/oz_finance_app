//
//  Stats.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

struct Stats: Codable {
    let total: Int?
    let totalCoins: Int?
    let totalMarkets: Int?
    let totalExchanges: Int?
    let totalMarketCap: String?
    let total24hVolume: String?
}
