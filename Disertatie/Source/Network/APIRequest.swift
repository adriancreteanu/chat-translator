
//
//  APIConfiguration.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 18/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Alamofire

protocol APIRequest: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var parameters: Parameters? { get }
    var parametersArray: [Parameters]? { get }
    var headers: [HTTPHeader] { get }
}

extension APIRequest {
    var headers: [HTTPHeader] {
        return [
            HTTPHeader(name: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue),
            HTTPHeader(name: HTTPHeaderField.accept.rawValue, value: ContentType.json.rawValue)
        ]
    }

    func asURLRequest() throws -> URLRequest {
        let url = Constants.API.baseURL + path
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = queryItems
        
        var request = try URLRequest(url: urlComponents.asURL())
        request.httpMethod = method.rawValue

        headers.forEach { httpHeader in
            request.addValue(httpHeader.value, forHTTPHeaderField: httpHeader.name)
        }

        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        if let parametersArray = parametersArray {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parametersArray)
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
    case contentLength = "Content-Length"
    case acceptEncoding = "Accept-Encoding"
    case apiSubscriptionKey = "Ocp-Apim-Subscription-Key"
    case clientTraceId = "X-ClientTraceID"
    case host = "Host"
}

enum ContentType: String {
    case json = "application/json"
}
