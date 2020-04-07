
//
//  APIConfiguration.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 18/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: [HTTPHeader] { get }
}

extension APIConfiguration {
    var headers: [HTTPHeader] {
        return [
            HTTPHeader(name: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue),
            HTTPHeader(name: HTTPHeaderField.accept.rawValue, value: ContentType.json.rawValue)
        ]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.API.baseURL.asURL()

        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue

        headers.forEach { httpHeader in
            request.addValue(httpHeader.value, forHTTPHeaderField: httpHeader.name)
        }

        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return request
    }
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case accept = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
