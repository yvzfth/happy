//
//  SignInView.swift
//  Happy
//
//  Created by Fatih Yavuz on 19.06.2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var user = User()
    @State private var isShowingDetailView = false

    var body: some View {
        NavigationStack {
            Text("Finger").font(.largeTitle)
          
            VStack {
                TextField("First Name", text: $user.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Last Name", text: $user.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $user.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Password", text: $user.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                NavigationLink(destination: SelectGenderView(), isActive: $isShowingDetailView) {
                    EmptyView()
                }
                
                Button(action: {
                    // Perform signup logic here
                    // You can access the entered values with firstName, lastName, email, and password variables
                    goToSignIn()
                    
                }, label:
                        {
                        Text("Go to Sign In")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                }).padding()
                
            
                
                Button(action: {
                    // Perform signup logic here
                    // You can access the entered values with firstName, lastName, email, and password variables
                    signUp()
                    
                }, label:
                        {
                    
                     
                        Text("Signup")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                        .cornerRadius(10)
                }).padding()
                
               
            }.padding()
                

            
        }.navigationTitle("Credentials").environmentObject(user)
    }
    func goToSignIn() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: SignInView())
            window.makeKeyAndVisible()
        }
    }
    func signUp()  {
        print(user)
        isShowingDetailView = true
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

