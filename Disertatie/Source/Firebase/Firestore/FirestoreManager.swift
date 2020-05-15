//
//  FirestoreManager.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 14/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation
import ObjectMapper

class FirestoreManager {
    private let service: FirestoreService!
    
    init() {
        service = FirestoreService()
    }
    
    func createUser() {
        service.createUser()
    }
    
    func getAllData<T: BaseMappable>(from collection: FirestoreCollection, _ completion: @escaping ([T]?, Error?) -> Void) {
        service.getAllData(from: collection) { jsonArray, error in
            if error != nil {
                completion(nil, error)
            } else {
                guard let array = jsonArray else {
                    return
                }
                let data = array.compactMap { Mapper<T>().map(JSONObject: $0) }
                completion(data, nil)
            }
        }
    }
}
