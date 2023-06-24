//
//  SelectGenderView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI

struct SelectGenderView: View {
    @EnvironmentObject var user : User
    @State private var isShowingDetailView = false
//    @State private var genderSelection = "Other"
    let genders = [
//        "Male",
//        "Female",
        "Other",
        "Non-binary",
        "Genderqueer",
        "Transgender male",
        "Transgender female",
        "Agender",
        "Genderfluid",
        "Two-spirit",
        "Bigender",
        "Androgynous",
        ]
    
    var body: some View {
        VStack{
            Text("Select Gender").font(.title)
            Text($user.email.wrappedValue)
            Spacer()
            HStack(){
                
                Button {
                    selectGender(gender: "Female")
                } label: {
                    Text("Female").font(.title3).foregroundColor(.white).padding(40).background(user.gender == "Female" ? Color.red.opacity(0.7) :Color.red.opacity(0.5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.red, lineWidth: user.gender == "Female" ? 8 : 0))
                        .cornerRadius(20)
                }

                
                Button {
                    selectGender(gender: "Male")
                } label: {
                    

                    Text("Male").font(.title3).foregroundColor(.white).padding(40).padding(.horizontal, 12).background(user.gender == "Male" ? Color.blue.opacity(0.7):Color.blue.opacity(0.5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: user.gender == "Male" ? 8 : 0))
                    .cornerRadius(20)
                    
                }
            }
            Picker("Select a gender", selection: $user.gender) {
                ForEach(genders, id: \.self) {
                    Text($0)
                }
            }
            
            .pickerStyle(.menu)
            
            .padding(30)
            .background(.mint.opacity(0.15))
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.mint, lineWidth:( user.gender != "Male" && user.gender != "Female" )  ? 8 : 0))
            .cornerRadius(20)
            Spacer()
            
            NavigationLink(destination: SelectInterestsView(), isActive: $isShowingDetailView) {
                EmptyView()
            }
            Button(action: {selectGender()}) {
               
                    
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            
            
        }
    }
    func selectGender() {
        print(user.gender)
        isShowingDetailView = true
    }
    func selectGender(gender: String) {
        user.gender = gender
    }
    
}

struct SelectGenderView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGenderView()
    }
}
