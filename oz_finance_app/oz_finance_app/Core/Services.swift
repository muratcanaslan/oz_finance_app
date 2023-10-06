//
//  Services.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

protocol ServicesProtocol: AnyObject {
    func getList(completion: @escaping (Result<CoinResponseModel , Error>) -> Void)
}

final class Services {
    
    class func getList(completion: @escaping (Result<CoinResponseModel , Error>) -> Void) {
        ServiceManager.shared.request(.list, completion: completion)
    }
}
