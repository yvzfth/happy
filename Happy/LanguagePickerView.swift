//
//  LanguagePickerView.swift
//  Happy
//
//  Created by Fatih Yavuz on 17.07.2023.
//

/* import SwiftUI

 struct LanguagePickerView: View {
     @State private var selectedLanguages: Set<UUID> = []
     @EnvironmentObject var user: User
     @State private var isShowingDetailView = false
     let languages: [Language] = LanguageEnum.allCases.map { Language(name: $0.rawValue) }
     var body: some View {
         VStack {
             List(languages, selection: $selectedLanguages) { lang in
                 Text(lang.name)
             }
         }
         .toolbar { EditButton() }

         NavigationLink(destination: SelectInterestsView(), isActive: $isShowingDetailView) {
             EmptyView()
         }
         Button(action: { next() }) {
             Text("Next")
                 .foregroundColor(.white)
                 .padding()
                 .background(Color.blue)
                 .cornerRadius(10)
         }
     }

     func next() {
         isShowingDetailView = true
     }
 }

 struct LanguagePickerView_Previews: PreviewProvider {
     static var previews: some View {
         LanguagePickerView()
     }
 } */
import SwiftUI
struct RowView: View {
    let element: Language
    let isSelected: Bool

    var body: some View {
        // Implement your custom row view here, displaying the element name and any other information
        Text(element.name)
            .foregroundColor(isSelected ? .white : .black)
            .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                               
                         .listRowBackground(isSelected ? Color.accentColor: Color.white)
    }
}

struct LanguagePickerView: View {
    @EnvironmentObject var user: User
    @State private var isShowingDetailView = false
    @State private var selectedElements: [Language] = []
    let languages: [Language] = LanguageEnum.allCases.map { Language(name: $0.rawValue) }
    var body: some View {
        List {
            ForEach(languages) { element in
                RowView(element: element, isSelected: self.isSelected(element))
                    .onTapGesture {
                        self.toggleSelection(element)
                    }
            }
        }.listStyle(InsetGroupedListStyle())
        
        NavigationLink(destination: SelectInterestsView(), isActive: $isShowingDetailView) {
            EmptyView()
        }

        Button(action: { next() }) {
            Text("Next")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }

    }

    private func isSelected(_ element: Language) -> Bool {
        return selectedElements.contains(element)
    }

    private func toggleSelection(_ element: Language) {
        if let index = selectedElements.firstIndex(of: element) {
            selectedElements.remove(at: index)
        } else {
            selectedElements.append(element)
        }
    }


    func next() {
        user.languages = selectedElements
        isShowingDetailView = true
        
    }
}

struct LanguagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagePickerView()
    }
}
