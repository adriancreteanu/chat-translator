//
//  FirestoreService.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 14/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Firebase
import Foundation

typealias DBWriteCompletion = (Bool, Error?) -> Void

class FirestoreService {
    private let database: Firestore!
    
    init() {
        self.database = Firestore.firestore()
    }
    
    func createUser(withUID uid: String, then handler: @escaping DBWriteCompletion) {
        database.collection("users").document(uid).setData([
            "firstName": "Adrian",
            "lastName": "Creteanu",
            "email": "creteanu.adrian@gmail.com"
        ]) { error in
            if let error = error {
                handler(false, error)
            } else {
                handler(true, nil)
            }
        }
    }
    
    func getAllUsers() {
        database.collection(FirestoreCollection.users.name)
            .getDocuments { snapshot, error in
                
                if let err = error {
                    print("Error getting documents: \(err)")
                } else {
                    for document in snapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
    }
    
    func getDocument(from collection: FirestoreCollection, _ completion: @escaping (JSON?, Error?) -> Void) {
        let docRef = database.collection(collection.name).document("O2pOdqPzh0vQyzdUaMbh")
        
        docRef.getDocument(completion: { snapshot, error in
            if error != nil {
                completion(nil, error)
            } else {
                if let document = snapshot, document.exists {
                    completion(document.data(), nil)
                }
            }
            
        })
    }
    
    func getArrayQueryData(from collection: FirestoreCollection,
                           query: String,
                           _ completion: @escaping (JSONArray?, Error?) -> Void) {
        database.collection(collection.name)
            .whereField("userIds", arrayContains: query)
            .getDocuments(completion: { snapshot, error in
                if error != nil {
                    completion(nil, error)
                    
                } else {
                    var jsonArray: JSONArray = []
                    
                    for document in snapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        
                        var jsonObject = document.data()
                        jsonObject["documentId"] = document.documentID
                        jsonArray.append(jsonObject)
                    }
                    
                    completion(jsonArray, nil)
                }
            })
    }

    func getQueryData(from collection: FirestoreCollection,
                      query: String,
                      _ completion: @escaping (JSONArray?, Error?) -> Void) {
        database.collection(collection.name)
            .whereField("chatId", isEqualTo: query)
            .getDocuments(completion: { snapshot, error in
                if error != nil {
                    completion(nil, error)

                } else {
                    var jsonArray: JSONArray = []

                    for document in snapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        jsonArray.append(document.data())
                    }

                    completion(jsonArray, nil)
                }
            })
    }
    
    
    func getAllData(from collection: FirestoreCollection,
                    query: String? = nil,
                    _ completion: @escaping (JSONArray?, Error?) -> Void) {
        database.collection(collection.name)
            .getDocuments(completion: { snapshot, error in
                if error != nil {
                    completion(nil, error)
                    
                } else {
                    var jsonArray: JSONArray = []
                    
                    for document in snapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        jsonArray.append(document.data())
                    }
                    
                    completion(jsonArray, nil)
                }
            })
    }
}

enum FirestoreCollection: String {
    case chats
    
    case users
    
    case messages
    
    var name: String {
        return rawValue
    }
}
