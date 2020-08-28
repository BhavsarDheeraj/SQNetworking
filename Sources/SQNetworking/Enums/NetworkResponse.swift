//
//  NetworkResponse.swift
//
//  Created by Dheeraj Bhavsar on 28/08/20.
//  Copyright © 2020 Squareboat. All rights reserved.
//

public enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}
