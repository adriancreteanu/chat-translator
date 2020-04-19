//
//  APIClient.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 07/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T: Decodable>(
        _ request: APIRequest,
        completion: @escaping (AFResult<T>) -> Void) -> DataRequest {
        return AF.request(request)
            .validate()
            .responseDecodable { (response: AFDataResponse<T>) in
                completion(response.result)
            }
    }

    static func translate(
        _ text: String,
        from source: String,
        to target: String,
        completion: @escaping (AFResult<[ReturnedJson]>) -> Void) {
        performRequest(
            TranslationEndpoint.translate(text, from: source, to: target),
            completion: completion)
    }
}
