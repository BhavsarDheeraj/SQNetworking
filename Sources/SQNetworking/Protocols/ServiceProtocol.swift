//
//  ServiceProtocol.swift
//
//  Created by Dheeraj Bhavsar on 28/08/20.
//  Copyright © 2020 Squareboat. All rights reserved.
//

import Foundation

public typealias Headers = [String: String]

public protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}
