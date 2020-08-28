//
//  ExampleService.swift
//
//  Created by Dheeraj Bhavsar on 28/08/20.
//  Copyright © 2020 Squareboat. All rights reserved.
//

import Foundation

enum ExampleService: ServiceProtocol {
    
    case all
    case examples(id: Int)
    
    var baseURL: URL {
        #if DEBUG
            return URL(string: "https://staging.example.com/")!
        #else
            return URL(string: "https://prod.example.com/")!
        #endif
    }
    
    var path: String {
        switch self {
        case .all:
            return "all"
        case .examples:
            return "examples"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .all:
            return .requestPlain
        case let .examples(id):
            let parameters = ["id": id]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .json
    }
}

struct Example: Codable {
    var body: String
}

func getExamples() {
    URLSessionProvider().request(type: [Example].self, service: ExampleService.all) { response in
        switch response {
        case let .success(exaples):
            print(exaples)
        case let .failure(error):
            print(error)
        }
    }
}
