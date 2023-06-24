//
//  MessagesView.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase
struct MessagesView: View {
    @State var book : Book?
    @State var title = ""
    @State var numberOfPages = 0
    @State var author = ""
    
    var body: some View {
        VStack {
            
        
        Text("Book")
            if let book = book {
                
                Text(book.title)
            }
            else {
                Text("no book")
            }
        TextField("Title", text: $title)
        TextField("Number Of Pages", value: $numberOfPages, format: .number)
        TextField("Author", text: $author)
        Button {
            addBook()
        } label: {
            Text("Add Book")
        }
        }.onAppear()
        {
           fetchBook(documentId: "WbyTqNVoOAolDwtecxEm")
       }

    }
    func addBook() {
        let db = Firestore.firestore()
        let collectionRef = db.collection("books")
        
          let book = Book(title: "The Hitchhiker's Guide to the Galaxy",
                          numberOfPages: 816,
                          author: "Douglas Adams")
         
            do {
              let newDocReference = try collectionRef.addDocument(from: book)
              print("Book stored with new document reference: \(newDocReference)")
            }
            catch {
              print(error)
            }
            
        
       
        
     
    }
    private func fetchBook(documentId: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("books").document(documentId)
//        docRef.getDocument { document, error in
//            if let error = error as NSError? {
//              print( "Error getting document: \(error.localizedDescription)")
//            }
//            else {
//              if let document = document {
//                do {
//                  self.book = try document.data(as: Book.self)
//                }
//                catch {
//                  print(error)
//                }
//              }
//            }
//          }
        
      docRef.getDocument(as: Book.self, decoder: Firestore.Decoder()) { result in
        switch result {
        case .success(let book):
          // A Book value was successfully initialized from the DocumentSnapshot.
          self.book = book
          print(book)
        case .failure(let error):
          // A Book value could not be initialized from the DocumentSnapshot.
         print("Error decoding document: \(error.localizedDescription)")
        }
      }
    }
}


struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}

struct Book {
    @DocumentID var id: String?
    var title: String
    var numberOfPages: Int
    var author: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case numnberOfPages
        case author
    }
}

extension Book: Decodable {
    init(from decoder:Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            title = try values.decode(String.self, forKey: .title)
            numberOfPages = try values.decode(Int.self, forKey: .numnberOfPages)
            author = try values.decode(String.self, forKey: .author)
    }
}
extension Book : Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(numberOfPages, forKey: .numnberOfPages)
        try container.encode(author, forKey: .author)
    }
}
