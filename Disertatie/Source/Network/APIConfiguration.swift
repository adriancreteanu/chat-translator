
//
//  APIConfiguration.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 18/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Alamofire

//typealias Headers = [String: String]

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: [HTTPHeader] { get }
}

