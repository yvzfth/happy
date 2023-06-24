//
//  BioView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI

struct BioView: View {
    
    @EnvironmentObject var user: User
    
    @State private var isShowingDetailView = false

  
    var body: some View {
        ScrollView {
            Text("Write a Bio")
                .font(.title)
                .padding()

            TextEditor(text: $user.bio)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.gray, lineWidth: 2)
                ).frame(minHeight: 200)
                .padding()

            VStack(alignment: .leading) {
                DatePicker("Birthday", selection: $user.birthday, displayedComponents: .date)
                    .datePickerStyle(.compact)
                Text("Nationality")
                TextField("Nationality", text: $user.nationality)
                    .textFieldStyle(.roundedBorder)
                
                
                Text("Height")
                TextField("Height", value: $user.height, format: .number)
                    .textFieldStyle(.roundedBorder)
                Text("Weight")
                TextField("Weight", value: $user.weight, format: .number)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            NavigationLink(destination: ProfileImagePickerView(), isActive: $isShowingDetailView) {
                EmptyView()
            }

            Button(action: {
                saveBio()
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
    }

    private func saveBio() {
        // Perform action to save the bio text and other details
        isShowingDetailView = true
    }
}

struct BioView_Previews: PreviewProvider {
    static var previews: some View {
        BioView()
    }
}
