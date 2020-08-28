//
//  URLComponentsExtension.swift
//
//  Created by Dheeraj Bhavsar on 28/08/20.
//  Copyright © 2020 Squareboat. All rights reserved.
//

import Foundation

public extension URLComponents {
    
    init(service: ServiceProtocol) {
        let url = service.baseURL.appendingPathComponent(service.path)
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .url else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
