//
//  SelectGenderView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI

struct SelectGenderView: View {
    @EnvironmentObject var user: User
    @State private var isShowingDetailView = false
    @State private var selectedGender: String = GenderEnum.other.rawValue
    var body: some View {
        VStack {
            Text("Select Gender").font(.title)
            Text($user.email.wrappedValue)
            Spacer()
            HStack {
                Button {
                    selectGender(gender: GenderEnum.female.rawValue)
                } label: {
                    Text(GenderEnum.female.rawValue).font(.title3).foregroundColor(.white).padding(40).background(user.gender.name == GenderEnum.female.rawValue ? Color.red.opacity(0.7) : Color.red.opacity(0.5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.red, lineWidth: selectedGender == GenderEnum.female.rawValue ? 8 : 0))
                        .cornerRadius(20)
                }

                Button {
                    selectGender(gender: GenderEnum.male.rawValue)
                } label: {
                    Text(GenderEnum.male.rawValue).font(.title3).foregroundColor(.white).padding(40).padding(.horizontal, 12).background(user.gender.name == GenderEnum.male.rawValue ? Color.blue.opacity(0.7) : Color.blue.opacity(0.5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: selectedGender == GenderEnum.male.rawValue ? 8 : 0))
                        .cornerRadius(20)
                }
            }
            Picker("Select a gender", selection: $selectedGender) {
                ForEach(GenderEnum.allCases, id: \.self) { gender in
                    if gender.rawValue != GenderEnum.male.rawValue && gender.rawValue != GenderEnum.female.rawValue {
                        Text(gender.rawValue).tag(gender.rawValue)
                    }
                }
            }
            
            .pickerStyle(.menu)
            
            .padding(30)
            .background(.mint.opacity(0.15))
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.mint, lineWidth: (selectedGender != GenderEnum.male.rawValue && selectedGender != GenderEnum.female.rawValue) ? 8 : 0))
            .cornerRadius(20)
            Spacer()
            
            NavigationLink(destination: InterestedGenderView(), isActive: $isShowingDetailView) {
                EmptyView()
            }
            Button(action: { selectGender() }) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }

   private func selectGender() {
    
       
       user.gender = Gender(name: selectedGender)
       print(user.gender)
       isShowingDetailView = true
      
    }

    private func selectGender(gender: String) {
        selectedGender = gender
    }
}

struct SelectGenderView_Previews: PreviewProvider {
  
    static var previews: some View {
        SelectGenderView()
    }
}
