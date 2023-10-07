//
//  CryptoSortType.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 7.10.2023.
//

import Foundation

enum CryptoSortType: Int, CaseIterable {
    case `default`
    case price
    case marketCap
    case volume24h
    case change
    case listedAt
    
    var title: String {
        switch self {
        case .default:
            return "Default"
        case .price:
            return "Price"
        case .marketCap:
            return "Market Cap"
        case .volume24h:
            return "24H Volume"
        case .change:
            return "Change"
        case .listedAt:
            return "Listed At"
        }
    }
}
