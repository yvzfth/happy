//
//  SignInView.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import SwiftUI
import FirebaseAuth
struct SignInView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        
        Text("Finger").font(.largeTitle)
        
        TextField("Email", text: $email)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding()
        
        SecureField("Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        Button(action: {
            // Perform signup logic here
            // You can access the entered values with firstName, lastName, email, and password variables
            goToSignUp()
            
        }, label:
                {
                Text("Go to Sign Up")
                    .frame(maxWidth: .infinity, alignment: .trailing)
        }).padding()
        
        Button(action: {
            // Perform signup logic here
            // You can access the entered values with firstName, lastName, email, and password variables
            signIn()
            
        }, label:
                {
                Text("Sign In")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                .cornerRadius(10)
        }).padding()
    }
    func goToSignUp () {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: SignUpView())
            window.makeKeyAndVisible()
        }
    }
   
    func signIn()  {
        
        Auth.auth().signIn(withEmail: email, password:  password){
        (authdata, error) in
                       if error != nil {
                           print(error?.localizedDescription ?? "Error")

                       } else {
                          
                           if let window = UIApplication.shared.windows.first {
                               window.rootViewController = UIHostingController(rootView: MainView())
                               window.makeKeyAndVisible()
                           }
                       }
                   }
        
        
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
