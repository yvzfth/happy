//
//  ProfileView.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State var user : FirestoreUser?
    var body: some View {
        
        ScrollView {
            Text("Profile")
                  .font(.title)
                  .padding()
            
         

           
              
            if let user = firestoreManager.user {
                  // Profile Image
                  AsyncImage(url: user.images.first as? URL){ image in
                      image
                          .resizable() .frame(width: 100, height: 100).cornerRadius(50)
                  }placeholder: {
                      Image(systemName: "person.fill")
                  }
                  Group{
                      Text("\(user.firstName) \(user.lastName)")
                      Text("\(user.email)")
                      Text("Gender: \(user.gender)")
                  }
                  
                  Group {
                      Text("Interests:")
                      ForEach(user.interests) { interest in
                          Text(interest.name)
                          ForEach(interest.subcategories) { subcategory in
                              Text("- \(subcategory.name)")
                          }
                      }
                      
                      Text("Places:")
                      ForEach(user.places) { place in
                          Text(place.name)
                      }
                      
                      Text("Descriptions:")
                      ForEach(user.descriptions) { description in
                          Text(description.name)
                      }
                  }
                  
                  
                  Text("Bio: \(user.bio)")
                  
                  Text("Images:")
                  ForEach(user.images, id: \.self) { imageURL in
                      if let imageURL = imageURL {
                          // Display image using imageURL
                          Image(systemName: "photo")
                      } else {
                          Text("No image available")
                      }
                  }
                  
                  Text("Height: \(user.height)")
                  Text("Weight: \(user.weight)")
                  Text("Birthday: \(user.birthday)")
                  Text("Nationality: \(user.nationality)")
              } else {
                  ProgressView("Loading...")
              }
              
              Spacer()
            
            
            
            // Sign Out
            
            Button(action: signOut) {
                Label("Sign Out", systemImage: "person")
            }
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
            
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: SignUpView())
                window.makeKeyAndVisible()
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView() .environmentObject(FirestoreManager())
    }
}
