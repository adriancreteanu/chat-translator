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
    
    func createUser(withUID uid: String, then handler: @escaping DBWriteCompletion) {
        service.createUser(withUID: uid, then: handler)
    }
    
    func getArrayQueryData<T: BaseMappable>(from collection: FirestoreCollection,
                                     query: String,
                                     _ completion: @escaping ([T]?, Error?) -> Void) {
        
        service.getArrayQueryData(from: collection, query: query) { jsonArray, error in
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
    
    func getMultipleQueryData<T: BaseMappable>(from collection: FirestoreCollection,
                                       field: String,
                                       query: String,
                                       _ completion: @escaping ([T]?, Error?) -> Void) {
        service.getQueryData(from: collection, field: field, query: query) { jsonArray, error in
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
    
    func getQueryData<T: BaseMappable>(from collection: FirestoreCollection,
                                       field: String,
                                       query: String,
                                       _ completion: @escaping (T?, Error?) -> Void) {
        service.getQueryData(from: collection, field: field, query: query) { jsonArray, error in
            if error != nil {
                completion(nil, error)
            } else {
                guard
                    let array = jsonArray, array.count == 1,
                    let json = array.first else {
                    completion(nil, nil)
                    return
                }
                
                let data = Mapper<T>().map(JSONObject: json)
                completion(data, nil)
            }
        }
    }
    
    func getAllData<T: BaseMappable>(from collection: FirestoreCollection,
                                     _ completion: @escaping ([T]?, Error?) -> Void) {
        
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
    
    func getDocument<T: BaseMappable>(from collection: FirestoreCollection, _ completion: @escaping (T?, Error?) -> Void) {
        service.getDocument(from: collection) { json, error in
            if error != nil {
                completion(nil, error)
            } else {
                guard let json = json else {
                    return
                }
                
                let data = Mapper<T>().map(JSONObject: json)
                completion(data, nil)
            }
        }
    }
}
