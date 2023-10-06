//
//  CoinResponseModel.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

struct CoinResponseModel: Decodable {
    let data: CoinResponse?
    
    struct CoinResponse: Decodable {
        let stats: Stats?
        let coins: [Coin]?
    }
}
