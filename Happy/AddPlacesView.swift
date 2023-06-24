//
//  AddPlacesView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI


struct AddPlacesView: View {

    @State private var newPlace: String = ""
    @EnvironmentObject var user : User
    
    @State private var isShowingDetailView = false
    
    var body: some View {
        VStack {
            Text("Add Your Visited Places")
                .font(.title)
                .padding()
            
            TextField("Enter a place", text: $newPlace)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                addPlace()
            }) {
                Text("Add Place")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            List(user.places) { place in
                Text(place.name)
            }
            .padding()
            Spacer()
            
            NavigationLink(destination: SelfDescriptionView(), isActive: $isShowingDetailView){EmptyView()}
            
            Button(action: {
                next()
            }) {
               
                    
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                
            }
            
        }
    }
    private func next() {
        // next button click
        isShowingDetailView = true
    }
    
    private func addPlace() {
        guard !newPlace.isEmpty else { return }
        let place = Place(name: newPlace)
        
        user.places.append(place)
        newPlace = ""
    }
}

struct AddPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlacesView()
    }
}
