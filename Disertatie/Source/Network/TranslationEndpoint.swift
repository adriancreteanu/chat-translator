//
//  TranslationEndpoint.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 07/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Alamofire

enum TranslationEndpoint: APIRequest {
    case translate(from: String, to: String) // This will be a country code enum
    
    var method: HTTPMethod {
        switch self {
        case .translate: return .post
        }
    }
    
    var path: String {
        switch self {
        case .translate: return "/translate"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .translate(let from, let to):
            return [
                URLQueryItem(name: "api-version", value: "3.0"),
                URLQueryItem(name: "from", value: from),
                URLQueryItem(name: "to", value: to),
            ]
            
        default: return nil
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var parametersArray: [Parameters]? {
        switch self {
        case .translate:
            let params: [[String: String]] = [
                ["text": "The big brown fox jumps over the lazy dog..."],
            ]
            return params
        }
    }
    
    var headers: [HTTPHeader] {
        return [
            HTTPHeader(name: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue),
            HTTPHeader(name: HTTPHeaderField.accept.rawValue, value: ContentType.json.rawValue),
            HTTPHeader(name: HTTPHeaderField.apiSubscriptionKey.rawValue, value: "fc230c1e60644659b8f84949cb685926"),
            HTTPHeader(name: HTTPHeaderField.clientTraceId.rawValue, value: "A14C9DB9-0DED-48D7-8BBE-C517A1A8DBB0"),
            HTTPHeader(name: HTTPHeaderField.host.rawValue, value: "dev.microsofttranslator.com"),
        ]
    }
}
