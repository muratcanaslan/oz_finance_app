//
//  EndpointProtocol.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var header: [String: String]? { get }
    
    func request() -> URLRequest
}

enum HttpMethod: String {
    case get = "GET"
}
