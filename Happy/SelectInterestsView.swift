//
//  SelectInterestsView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI

import WrappingHStack

struct SelectInterestsView: View {
    @EnvironmentObject var user : User
    
    @State private var isShowingDetailView = false

    var body: some View {
        VStack {
            Text("Select Your Interests")
                .font(.title)
                .padding()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(user.interests) { interest in
                        VStack {
                            Button(action: {
                                toggleInterestSelection(interest)
                            }) {
                                Text(interest.name)
                                    .font(.headline)
                                    .foregroundColor(interest.isSelected ? .white : .primary)
                                    .padding()
                                    .background(interest.isSelected ? Color.blue : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            if interest.isSelected {
                                
                                WrappingHStack(alignment: .center) {
                                    
                                    ForEach(interest.subcategories) { subcategory in
                                        Button(action: {
                                            toggleSubcategorySelection(subcategory, in: interest)
                                        }) {
                                            HStack {
                                                Text(subcategory.name)
                                                    .font(.subheadline)
                                                    .foregroundColor(subcategory.isSelected ? .white : .secondary)
                                                    .padding()
                                                    .background(subcategory.isSelected ? Color.blue : Color.gray.opacity(0.2))
                                                    .cornerRadius(10)
                                                
                                                if subcategory.isSelected {
                                                    Image(systemName: "checkmark")
                                                        .foregroundColor(.white)
                                                        .padding()
                                                        .background(interest.isSelected ? Color.blue : Color.gray.opacity(0.2))
                                                        .cornerRadius(10)
                                                }
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .padding(.leading)
                                    }
                                }
                            }
                        }   .frame(width: UIScreen.main.bounds.width)
                    }
                }
                .padding()
             
            }
            NavigationLink(destination: AddPlacesView(), isActive: $isShowingDetailView ){EmptyView()}
            Button(action: {
                // Perform action when "Next" or "Done" button is tapped
                let selectedInterests = user.interests.filter { $0.isSelected }
                print("Selected Interests:")
                for interest in selectedInterests {
                    print("\(interest.name):")
                    for subcategory in interest.subcategories where subcategory.isSelected {
                        print("- \(subcategory.name)")
                    }
                }
                isShowingDetailView = true
            }) {
                
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .disabled(user.interests.filter { $0.isSelected }.isEmpty)
                
              
            }
            .padding()
        }
    }
    
    private func toggleInterestSelection(_ interest: Interest) {
//        if let index = interests.firstIndex(where: { $0.id == interest.id }) {
//            interests[index].isSelected.toggle()
//        }
        if let index = user.interests.firstIndex(where: { $0.id == interest.id }) {
                   user.interests[index].isSelected.toggle()
               }
    }
    
    private func toggleSubcategorySelection(_ subcategory: Subcategory, in interest: Interest) {
//        if let interestIndex = interests.firstIndex(where: { $0.id == interest.id }),
//           let subcategoryIndex = interests[interestIndex].subcategories.firstIndex(where: { $0.id == subcategory.id }) {
//            interests[interestIndex].subcategories[subcategoryIndex].isSelected.toggle()
//        }
        if let interestIndex = user.interests.firstIndex(where: { $0.id == interest.id }),
                   let subcategoryIndex = user.interests[interestIndex].subcategories.firstIndex(where: { $0.id == subcategory.id }) {
                    user.interests[interestIndex].subcategories[subcategoryIndex].isSelected.toggle()
                }
    }
}




struct SelectInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectInterestsView()
    }
}
