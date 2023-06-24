//
//  FirestoreManager.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import Foundation

import Firebase

class FirestoreManager: ObservableObject {

    @Published var user : FirestoreUser?
    
    init() {
        getUser()
    }
    
    func getUser()   {
        let userID = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        
        guard let uid = userID else {return}
          let docRef = db.collection("Users").document(userID!)

          // Force the SDK to fetch the document from the cache. Could also specify
          // FirestoreSource.server or FirestoreSource.default.
        
          docRef.getDocument(as:FirestoreUser.self, decoder: Firestore.Decoder()) { result in
               switch result {
                   
               case .success(let user):
                   
                 // A Book value was successfully initialized from the DocumentSnapshot.
                   
                 self.user = user
                 print(user)
                   
               case .failure(let error):
                   
                 // A Book value could not be initialized from the DocumentSnapshot.
                 print("Error decoding document: \(error.localizedDescription)")
                   
               }
              // User data fetched successfully
              // print("User data: \(self.user)")
              // Use the userData dictionary as needed
      }
   }
}
