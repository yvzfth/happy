//
//  ProfileView.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//
import FirebaseAuth
import FirebaseFirestore
import Popovers
import SwiftUI
import WrappingHStack


struct LanguageChipView: View {
    let language: LanguageEnum
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(isSelected ? .green : .gray)
            
            Image(language.flagImage)
                .resizable()
                .frame(width: 20, height: 20)
        }
        .frame(width: 60, height: 30)
        .padding(.horizontal, 4)
    }
}

struct ProfileView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State var user: FirestoreUser?
    @State private var showPopover = false
    @State private var showSetting = false
    var body: some View {
        ScrollView {
            if let user = firestoreManager.user {
                // Profile Image
                HStack(spacing: 20) {
                    ZStack(alignment: .bottomTrailing) {
                        AsyncImage(url: user.images.first as? URL) { image in
                            image
                                .resizable().frame(width: 80, height: 80).cornerRadius(40)
                        } placeholder: {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.top, 20)
                        }
                      
                        Button(action: {
                            showPopover.toggle()
                        }, label: {
                            Text(user.gender.name == GenderEnum.male.rawValue ? "⚦" : "♀")
                                //  .padding(.top, 2) // Add 20 points of padding to the top
                                .padding(.leading, 4) // Add 40 points of padding to the leading (left) side
                                // .padding(.trailing, 6)
                                .padding(.bottom, 6)
                                .background(.red)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .cornerRadius(100)
                                .shadow(color: .gray, radius: 3, x: 0, y: 1) // Add a shadow to the text
                                               
                                .offset(x: 5, y: -5)
                        }).popover(present: $showPopover) {
                            Text(user.gender.name)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(16)
                        }
                    }
                    // name
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.title)
                            .foregroundColor(.blue)
                        // username
                        Text("\(user.email)")
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    
                    // Setting button
                    VStack(alignment: .trailing) {
                        Button(action: {
                            showSetting.toggle()
                        }, label: {
                            Image("setting")
                                .resizable()
                                .padding(0)
                                .frame(width: 25, height: 25)
                          
                        }).popover(present: $showSetting) {
                            // Sign Out
                            
                            Button(action: signOut) {
                                Label("Sign Out", systemImage: "person").padding(10)
                            }
                        }
                   
                    }
                }
                Divider()
                
                WrappingHStack(alignment: .center) {
                    // Birthday Chip
                    HStack {
                        Image(systemName: "gift")
                            .foregroundColor(.orange)
                            .font(.headline)
                                    
                        let calendar = Calendar.current
                        let day = calendar.component(.day, from: user.birthday)
                        let month = calendar.component(.month, from: user.birthday)
                                        
                        VStack(alignment: .leading) {
                            Text("Birthday")
                                .font(.caption)
                                .foregroundColor(.gray)
                            HStack {
                                Text("\(day)")
                                    .font(.headline)
                                Text("\(calendar.shortMonthSymbols[month - 1])")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(15)
                    // Nationality Chip
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                            .font(.headline)
                                    
                        VStack(alignment: .leading) {
                            Text("Nationality")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(user.nationality)
                                .font(.headline)
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(15)
                    
                    // Languages Chip
                    HStack {
                        Image(systemName: "mic")
                            .foregroundColor(.green)
                            .font(.headline)
                                    
                        VStack(alignment: .leading) {
                            Text("Languages")
                                .font(.caption)
                                .foregroundColor(.gray)
                                        
                            ZStack(alignment: .leading) {
                                ForEach(user.languages.indices, id: \.self) { index in
                             
                                    Image(user.languages[index].name)
                                        .resizable()
                                        .padding(0)
                                        .frame(width: 20, height: 20)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .offset(x: CGFloat(index * 16))
                                        .zIndex(-Double(index))
                                        .shadow(color: .gray, radius: 2, x: 2, y: 1)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(15)
                     
                    // Display selected languages as flags
                }
                
                // Bio
                VStack(alignment: .leading, spacing: 5) {
                    Text("Bio")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(user.bio)
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.leading)
                }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading)
                    .padding(20)
                
                // Descriptions
                VStack(alignment: .leading, spacing: 5) {
                    Text("Descriptions")
                        .font(.headline)
                        .foregroundColor(.blue)
                                        
                    WrappingHStack(alignment: .center) {
                        ForEach(user.descriptions) { description in
                                      
                            Text(description.name).font(.subheadline).lineLimit(1)
                                .padding(.all, 10)
                                .foregroundColor(.blue)
                                .background(Color.white) // different UI for selected and not selected view
                                .cornerRadius(40) // rounded Corner
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.blue, lineWidth: 1.5)
                                )
                        }
                    }
                }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading)
                    .padding(20)
                Group {
                    Text("Interests")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    ForEach(user.interests) { interest in
                        Text(interest.name)
                        WrappingHStack(alignment: .center) {
                            ForEach(interest.subcategories) { subcategory in
                                Text(subcategory.name).font(.subheadline).lineLimit(1)
                                    .padding(.all, 10)
                                    .foregroundColor(.blue)
                                    .background(Color.white) // different UI for selected and not selected view
                                    .cornerRadius(40) // rounded Corner
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.blue, lineWidth: 1.5)
                                    )
                            }
                        }
                    }
                    
                    Text("Places")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .font(.headline)
                        .foregroundColor(.blue)
                    WrappingHStack(alignment: .center) {
                        ForEach(user.places) { place in
                            Text(place.name).font(.subheadline).lineLimit(1)
                                .padding(.all, 10)
                                .foregroundColor(.blue)
                                .background(Color.white) // different UI for selected and not selected view
                                .cornerRadius(40) // rounded Corner
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.blue, lineWidth: 1.5)
                                )
                        }
                    }
                }
                
                Text("Images") .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .font(.headline)
                    .foregroundColor(.blue)
                
                WrappingHStack(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(user.images, id: \.self) { imageURL in
                        if let imageURL = imageURL {
                            // Display image using imageURL
                            // Image(systemName: "photo")
                        
                            AsyncImage(url: imageURL as URL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 400, height: 300)
                                    .cornerRadius(10)
                            } placeholder: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                    .clipShape(Rectangle())
                                    .padding(.top, 20)
                            }
                      
                        } else {
                            Text("No image available")
                        }
                    }
                }
                
            } else {
                ProgressView("Loading...")
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
        ProfileView().environmentObject(FirestoreManager())
    }
}
