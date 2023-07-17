//
//  ProfileImagePickerView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI
import PhotosUI
import CoreTransferable
import FirebaseAuth
import Firebase
import FirebaseStorage

struct ProfileImagePickerView: View {
    @State private var isShowingImagePicker = false
    //    @State private var selectedImages: [IdentifiableImage] = []
    //    @State var images: [Data] = []
    @State var selectedItems: [PhotosPickerItem] = []
    
    @EnvironmentObject var user : User
    
    @State private var isShowingDetailView = false
    @StateObject var firestoreManager = FirestoreManager()
    
    var body: some View {
        VStack {
            
            
            Text("Pick Profile Images")
                .font(.title)
            
            PhotosPicker(selection: $selectedItems,
                         matching: .images) {
                Text("Pick Photo")
            }
                         .onChange(of: selectedItems) { selectedItems in
                             user.images = []
                             
                             
                             
                             for item in selectedItems {
                                 item.loadTransferable(type: Data.self) { result in
                                     switch result {
                                     case .success(let imageData):
                                         if let imageData {
                                             DispatchQueue.main.async {
                                                 self.user.images.append(imageData)
                                             }
                                         } else {
                                             print("No supported content type found.")
                                         }
                                     case .failure(let error):
                                         print(error)
                                     }
                                 }
                                 
                             }
                         }
            
            if user.images.isEmpty {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        
                        
                        ForEach(user.images, id:\.self){ imageData in
                            if let uiImage = UIImage(data: imageData) {
                                
                                
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .padding()
                            }
                            
                        }
                    }
                    
                }
                
            }
            Spacer()
            
            Button(action: {save()}) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }.padding()
        }.navigate(to: MainView(), when: $isShowingDetailView)
        
    }
    
    func save()  {
        
        // Auth
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) {authdata, error in
            if error != nil {
                print(error?.localizedDescription ?? "create user error")
                
            } else {
                guard authdata != nil else {
                    return print(error?.localizedDescription ?? "create user error")
                }
                
               
                
                var userData : [String: Any]  =
                ["firstName": user.firstName,
                 "lastName": user.lastName,
                 "email": user.email,
                 "password": user.password,
                 "gender": user.gender,
                 "interests": user.interests.filter{ $0.isSelected }.map { interest -> [String: Any]?  in
                    return ["name": interest.name, "subcategories": interest.subcategories
                        .filter{ $0.isSelected }
                        .map { $0.name }]
                },
                 "places": user.places.map{ $0.name },
                 "descriptions":  user.descriptions.filter{ $0.isSelected }.map{ $0.name },
                 "bio": user.bio,
//                 "images": user.images,
                 "height": user.height,
                 "weight": user.weight,
                 "birthday": user.birthday,
                 "nationality": user.nationality
                ]
                let descriptions : [String] =  userData["descriptions"] as! [String]
//                let interests: [String: Any] = userData["interests"] as! [String: Any]
                let places : [String] = userData["places"] as! [String]
                let ref = Firestore.firestore().collection("Users").document(authdata!.user.uid)
                
                do {
                    let firestoreUser = FirestoreUser(firstName: user.firstName, lastName: user.lastName, email: user.email, password: user.password, gender: user.gender, interests: user.interests.filter{ $0.isSelected }.map { interest in
                        let firestoreSubcategories = interest.subcategories .filter{ $0.isSelected }.map { subcategory in
                            FirestoreSubcategory(name: subcategory.name)
                        }
                        return FirestoreInterest(name: interest.name, subcategories: firestoreSubcategories)
                    }, places: places.map {FirestorePlace(name: $0)}, descriptions: descriptions.map {  FirestoreDescription(name: $0) } , bio: user.bio, images: [], height: user.height, weight: user.weight, birthday: user.birthday, nationality: user.nationality, interestedGender: user.interestedGender, languages: user.languages )
                    
                    //DATABASE
                    try ref.setData(from: firestoreUser, encoder: Firestore.Encoder(), completion: { (error) in
                        if error != nil {
                            
                            print(error?.localizedDescription ?? "firestore user error")
                        } else {
                            
                            // Storage
                            
                            let storage = Storage.storage()
                            let storageReference = storage.reference()
                            
                            let mediaFolder = storageReference.child("media")
                            
                            
                            for image in user.images  {
                                let uuid = UUID().uuidString
                                
                                let imageReference = mediaFolder.child("\(uuid).jpg")
                                imageReference.putData(image, metadata: nil) { (metadata, error) in
                                    if error != nil {
                                        print(error?.localizedDescription ?? "error")
                                    } else {
                                        
                                        imageReference.downloadURL { (url, error) in
                                            
                                            if error == nil {
                                                if let url = url?.absoluteString{
                                                    ref.updateData([
                                                        "images": FieldValue.arrayUnion([url])
                                                    ])
                                                    
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                                
                            }
                            
                            isShowingDetailView = true
                            
                        }
                    })
                } catch {
                    print("error")
                }
            }
        }
        
    }
    
}
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}



struct ProfileImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImagePickerView()
    }
}
