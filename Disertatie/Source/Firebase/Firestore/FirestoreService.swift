//
//  FirestoreService.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 14/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Firebase
import Foundation

class FirestoreService {
    private let database: Firestore!
    
    init() {
        self.database = Firestore.firestore()
    }
    
    func createUser() {
        var ref: DocumentReference?
        
        ref = database.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ], completion: { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        })
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
    
    func getQueryData(from collection: FirestoreCollection,
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
