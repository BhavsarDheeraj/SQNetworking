# SQNetworking

SQNetworking is a Protocol Oriented Swift package for Networking.

## Installation

### Swift Package Manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding Utilities as a dependency is as easy as adding it to the ``dependencies`` value of your ``Package.swift``.

```swift

dependencies: [
    .package(url: "https://github.com/d-at-squareboat/SQNetworking.git", .upToNextMajor(from: "1.0.0"))
]

```


## Usage

```swift
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
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
Utilities is released under the MIT license. [See LICENSE](https://github.com/d-at-squareboat/SQNetworking/blob/master/LICENSE) for details.
