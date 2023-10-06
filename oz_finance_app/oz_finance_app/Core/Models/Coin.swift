//
//  CoinData.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

struct Coin: Codable {
    let uuid: String?
    let symbol: String?
    let name: String?
    let color: String?
    let iconUrl: URL?
    let marketCap: String?
    let price: String?
    let change: String?
    let rank: Int
    let lowVolume: Bool?
    let coinrankingUrl: URL?
    let volume24h: String?
    let btcPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color, iconUrl, marketCap, price, change, rank, lowVolume,coinrankingUrl, btcPrice
        case volume24h = "24hVolume"
    }
}
