//
//  APIRouter.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 18/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    private var method: HTTPMethod {
        return .get
    }
    
    private var path: String {
        return ""
    }
    
    private var parameters: Parameters? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        // TODO
    }
}
