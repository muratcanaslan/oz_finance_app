//
//  Endpoint.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

/// Endpoint List
enum Endpoint {
    case list
}

//MARK: - Endpoint Protocol
extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy"
    }
    
    var path: String {
        switch self {
        case .list:
            return "/coins"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var component = URLComponents(string: baseUrl) else { fatalError("Invalid Error") }
        
        component.path += path
        
        guard let url = component.url else { fatalError("Invalid Url") }
        
        var request = URLRequest(url: url)
        request.httpMethod =  method.rawValue
        return request
    }
}
