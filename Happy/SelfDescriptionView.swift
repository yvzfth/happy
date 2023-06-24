//
//  SelfDescriptionView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI
import WrappingHStack



struct SelfDescriptionView: View {
    
    @EnvironmentObject var user : User
    
    @State private var isShowingDetailView = false
    var body: some View {
        VStack {
            Text("Describe Yourself")
                .font(.title)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                    ForEach(user.descriptions) { desciption in
                        Button(action: {
                            toggleAdjectiveSelection(desciption)
                        }) {
                            Text(desciption.name)
                                .font(.headline)
                                .foregroundColor(desciption.isSelected ? .white : .primary)
                                .padding()
                                .background(desciption.isSelected ? Color.blue : Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }

            NavigationLink(destination: BioView(), isActive: $isShowingDetailView){EmptyView()}
                

            Button(action: {
                next()
            }) {
              
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } .padding()
            //  BadgeView(selectedAdjectives: adjectives.filter { $0.isSelected })
            //
        }
    private func next() {
        isShowingDetailView = true
    }
    

    private func toggleAdjectiveSelection(_ desciption: Description) {
        if let index = user.descriptions.firstIndex(where: { $0.id == desciption.id }) {
            user.descriptions[index].isSelected.toggle()
        }
    }
}

struct BadgeView: View {
    let selectedDescriptions: [Description]
    
    var body: some View {
        VStack {
            Text("Your Badge")
                .font(.headline)
                .padding()
            
            WrappingHStack(alignment: .leading) {
                ForEach(selectedDescriptions) { description in
                    Text(description.name)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct SelfDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelfDescriptionView()
    }
}
