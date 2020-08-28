//
//  Task.swift
//
//  Created by Dheeraj Bhavsar on 28/08/20.
//  Copyright © 2020 Squareboat. All rights reserved.
//

public typealias Parameters = [String: Any]

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
