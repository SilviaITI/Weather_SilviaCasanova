//
//  Request.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import Foundation

extension URLRequest {
    static func request(networkRequest: NetworkInterface) -> URLRequest {
        let baseUrl = Bundle.main.infoDictionary?["baseUrl"] as? String
        
        var components = URLComponents(string: baseUrl ?? "")
        components?.path = networkRequest.path
        
        if let query = networkRequest.query {
            components?.queryItems = query
        }
        
        guard let url = components?.url else {
            debugPrint("❌ URL is invalid")
            return URLRequest(url: URL(fileURLWithPath: ""))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = networkRequest.method.rawValue
        
        if let body = networkRequest.body {
            request.httpBody = body
        }
        
        request.allHTTPHeaderFields = networkRequest.headers
        
        var logMessage = "🚀 \(networkRequest.method.rawValue) \(url)"
        if let body = networkRequest.body {
            logMessage += " \(String(data: body, encoding: .utf8) ?? "")"
        }
        
        if let queryItems = networkRequest.query {
            let queryLog = queryItems.map { "\($0.name)=\($0.value ?? "")" }.joined(separator: "&")
            logMessage += "?\(queryLog)"
        }
        
        debugPrint("💡 Headers: \(request.allHTTPHeaderFields ?? [:])")
        
        return request
    }
}
